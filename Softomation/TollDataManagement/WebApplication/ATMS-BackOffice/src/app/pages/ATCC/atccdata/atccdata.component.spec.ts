import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AtccdataComponent } from './atccdata.component';

describe('AtccdataComponent', () => {
  let component: AtccdataComponent;
  let fixture: ComponentFixture<AtccdataComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AtccdataComponent]
    });
    fixture = TestBed.createComponent(AtccdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
