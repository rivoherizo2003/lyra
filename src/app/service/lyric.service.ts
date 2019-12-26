import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LyricService {

  constructor() { }

  searchLyric(term: string): Observable<Lyric[]> {

  }
}
