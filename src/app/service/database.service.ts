import { Injectable } from '@angular/core';
import { SQLiteObject, SQLite } from '@ionic-native/sqlite/ngx';
import { BehaviorSubject, Observable } from 'rxjs';
import { Platform } from '@ionic/angular';
import { SQLitePorter } from '@ionic-native/sqlite-porter/ngx';
import { HttpClient } from '@angular/common/http';
import { Lyric } from '../interface/lyric';

@Injectable({
  providedIn: 'root'
})
export class DatabaseService {
  private database: SQLiteObject;
  private dbReady: BehaviorSubject<boolean> = new BehaviorSubject(false);
  lyricsGala = new BehaviorSubject([]);
  lyricsRodobe = new BehaviorSubject([]);

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

  seedDatabase(){
    this.http.get('assets/lyrics.sql', {responseType: 'text'})
    .subscribe(sql => {
      this.sqlitePorter.importSqlToDb(this.database, sql)
        .then(_ => {
          
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
    return this.database.executeSql('SELECT * FROM lyrics where type=1',[]).then(data => {
      let lyricsGala: Lyric[] = [];
      if (data.rows.length > 0) {
        for (var i = 0; i< data.rows.length; i++) {
          let lyric_: Lyric;
          lyric_.id = data.rows.item(i).id;
          lyric_.title = data.rows.item(i).title;
          lyric_.lyric = data.rows.item(i).lyric;
          lyric_.author = data.rows.item(i).author;
          lyric_.keySong = data.rows.item(i).keySong;
          lyric_.type = data.rows.item(i).type;
          lyricsGala.push(lyric_);
        }
      }
      this.lyricsGala.next(lyricsGala);
    });
  }
}
