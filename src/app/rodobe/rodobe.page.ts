import { Component, OnInit } from '@angular/core';
import { Lyric } from '../classes/lyric';
import { DatabaseService } from '../service/database.service';

@Component({
  selector: 'app-rodobe',
  templateUrl: './rodobe.page.html',
  styleUrls: ['./rodobe.page.scss'],
})
export class RodobePage implements OnInit {
  lyricsRodobe: Lyric[];

  constructor(private db: DatabaseService) { }

  ngOnInit() {
    this.db.getDatabaseState().subscribe(rdy => {
      if (rdy) {
        this.db.getLyricsRodobe().subscribe(lyricsRodobe => {
          this.lyricsRodobe = lyricsRodobe;
        })
      }
    })
  }

}
