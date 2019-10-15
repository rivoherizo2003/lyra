import { Component, OnInit } from '@angular/core';
import { DatabaseService } from '../service/database.service';
import { Lyric } from '../interface/lyric';

@Component({
  selector: 'app-gala',
  templateUrl: './gala.page.html',
  styleUrls: ['./gala.page.scss'],
})
export class GalaPage implements OnInit {
  lyricsGala: Lyric[] = [];
  constructor(private db: DatabaseService) { }

  ngOnInit() {
    this.db.getDatabaseState().subscribe(rdy => {
      if (rdy) {
        this.db.getLyricsGala().subscribe(lyricsGala => {
          this.lyricsGala = lyricsGala;
        })
      }
    })
  }

}
