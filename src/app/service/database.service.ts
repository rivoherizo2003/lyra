import { Injectable } from '@angular/core';
import { SQLiteObject, SQLite } from '@ionic-native/sqlite/ngx';
import { BehaviorSubject, Observable } from 'rxjs';
import { Platform } from '@ionic/angular';
import { SQLitePorter } from '@ionic-native/sqlite-porter/ngx';
import { HttpClient } from '@angular/common/http';
import { Lyric } from '../classes/lyric';

@Injectable({
  providedIn: 'root'
})
export class DatabaseService {
  private database: SQLiteObject;
  private dbReady: BehaviorSubject<boolean> = new BehaviorSubject(false);
  lyricsGala = new BehaviorSubject([]);
  lyricsRodobe = new BehaviorSubject([]);
  lyric = new BehaviorSubject([]);

  constructor(private plt: Platform, private sqlitePorter: SQLitePorter, private sqlite: SQLite, private http: HttpClient) {
    this.plt.ready().then(() => {
      this.sqlite.create({
        name: 'lyrics.db',
        location: 'default'
      })
        .then((db: SQLiteObject) => {
          this.database = db;
          this.seedDatabase();
        });
    });
  }

  seedDatabase() {
    this.http.get('assets/lyrics.sql', { responseType: 'text' })
      .subscribe(sql => {
        this.sqlitePorter.importSqlToDb(this.database, sql)
          .then(_ => {
            this.loadLyricsGala();
            this.loadLyricsRodobe();
            this.dbReady.next(true);
          })
          .catch(e => console.error(e));
      });
  }

  getDatabaseState() {
    return this.dbReady.asObservable();
  }

  getLyricsGala(): Observable<any[]> {
    return this.lyricsGala.asObservable();
  }

  getLyricsRodobe(): Observable<any[]> {
    return this.lyricsRodobe.asObservable();
  }

  loadLyricsGala() {
    return this.database.executeSql('SELECT * FROM lyrics where type=1', []).then(data => {
      let lyric: Lyric;
      let lyricsGala_: Lyric[] = [];

      if (data.rows.length > 0) {
        for (var i = 0; i < data.rows.length; i++) {
          lyric = {
            id : data.rows.item(i).id,
            title : data.rows.item(i).title,
            lyric : data.rows.item(i).lyric,
            author : data.rows.item(i).author,
            keySong : data.rows.item(i).keySong,
            type : data.rows.item(i).type,
          };
          lyricsGala_.push(lyric);
        }
      }
      this.lyricsGala.next(lyricsGala_);
    });
  }

  loadLyricsRodobe() {
    return this.database.executeSql('SELECT * FROM lyrics where type=2', []).then(data => {
      let lyric: Lyric;
      let lyricsRodobe_: Lyric[] = [];

      if (data.rows.length > 0) {
        for (var i = 0; i < data.rows.length; i++) {
          lyric = {
            id : data.rows.item(i).id,
            title : data.rows.item(i).title,
            lyric : data.rows.item(i).lyric,
            author : data.rows.item(i).author,
            keySong : data.rows.item(i).keySong,
            type : data.rows.item(i).type,
          };
          lyricsRodobe_.push(lyric);
        }
      }
      this.lyricsRodobe.next(lyricsRodobe_);
    });
  }

  getDetailLyric(id):Promise<Lyric> {
    return this.database.executeSql('SELECT * FROM lyrics where id=?', [id]).then(data => {
      let lyric: Lyric;
      if (data.rows.length > 0) {
        for (var i = 0; i < data.rows.length; i++) {
          lyric = {
            id : data.rows.item(i).id,
            title : data.rows.item(i).title,
            lyric : data.rows.item(i).lyric,
            author : data.rows.item(i).author,
            keySong : data.rows.item(i).keySong,
            type : data.rows.item(i).type,
          };
        }
      }
      return lyric;
    });
  }
}
