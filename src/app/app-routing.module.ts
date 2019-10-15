import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./tabs/tabs.module').then(m => m.TabsPageModule)
  }, 
  { path: 'gala', loadChildren: './gala/gala.module#GalaPageModule' },
  { path: '', loadChildren: './home/home.module#HomePageModule' },
  { path: 'rodobe', loadChildren: './rodobe/rodobe.module#RodobePageModule' },
  { path: 'lyrics', loadChildren: './lyrics/lyrics.module#LyricsPageModule' },
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
