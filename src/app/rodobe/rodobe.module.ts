import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { RodobePage } from './rodobe.page';

const routes: Routes = [
  {
    path: '',
    component: RodobePage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild([{path:'', component: RodobePage}])
  ],
  declarations: [RodobePage]
})
export class RodobePageModule {}
