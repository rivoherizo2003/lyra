//https://ionicframework.com/docs/angular/your-first-app/creating-photo-gallery-device-storageimport { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import { TabsPage } from './tabs.page';

const routes: Routes = [
  {
    path: 'lYrA',
    component: TabsPage,
    children: [
      {
        path: 'home',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../home/home.module').then(m => m.HomePageModule)
          }
        ]
      },
      {
        path: 'gala',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../gala/gala.module').then(m => m.GalaPageModule)
          }
        ]
      },
      {
        path: 'rodobe',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../rodobe/rodobe.module').then(m => m.RodobePageModule)
          }
        ]
      },
      {
        path: 'lyric',
        children: [
          {
            path:'',
            loadChildren: () =>
              import('../lyrics/lyrics.module').then(m => m.LyricsPageModule)
          }
        ]
      },
      {
        path: '',
        redirectTo: '/tabs/tab1',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: '/tabs/tab1',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TabsPageRoutingModule {}
