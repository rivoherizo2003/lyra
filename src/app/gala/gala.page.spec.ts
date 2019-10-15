import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GalaPage } from './gala.page';

describe('GalaPage', () => {
  let component: GalaPage;
  let fixture: ComponentFixture<GalaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GalaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GalaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
