import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AtccValidationComponent } from './atcc-validation.component';

describe('AtccValidationComponent', () => {
  let component: AtccValidationComponent;
  let fixture: ComponentFixture<AtccValidationComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AtccValidationComponent]
    });
    fixture = TestBed.createComponent(AtccValidationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
