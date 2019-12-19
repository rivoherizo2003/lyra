import { Component, OnInit } from '@angular/core';
import {Location} from '@angular/common';
import { Lyric } from '../classes/lyric';
import { ActivatedRoute, Router, ParamMap } from '@angular/router';
import { DatabaseService } from '../service/database.service';

@Component({
  selector: 'app-lyrics',
  templateUrl: './lyrics.page.html',
  styleUrls: ['./lyrics.page.scss'],
})
export class LyricsPage implements OnInit {
  lyric: Lyric = null;
  constructor(private location: Location, private route: ActivatedRoute,
     private router: Router, private db: DatabaseService) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      const lyricId = params.get('id');
      this.db.getDetailLyric(lyricId).then(data => {
        this.lyric = data;
      });
    });
  }

  goBack() {
    this.location.back();
  }
}
