import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AtccvalidatedComponent } from './atccvalidated.component';

describe('AtccvalidatedComponent', () => {
  let component: AtccvalidatedComponent;
  let fixture: ComponentFixture<AtccvalidatedComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AtccvalidatedComponent]
    });
    fixture = TestBed.createComponent(AtccvalidatedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
