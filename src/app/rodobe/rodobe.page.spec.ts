import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RodobePage } from './rodobe.page';

describe('RodobePage', () => {
  let component: RodobePage;
  let fixture: ComponentFixture<RodobePage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RodobePage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RodobePage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
