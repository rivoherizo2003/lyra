import { Component } from '@angular/core';
import { DatabaseService } from '../service/database.service';


@Component({
  selector: 'app-tabs',
  templateUrl: 'tabs.page.html',
  styleUrls: ['tabs.page.scss']
})
export class TabsPage {

  constructor(private db: DatabaseService) {}  
  
  ngOnInit() {
    
  }

}
