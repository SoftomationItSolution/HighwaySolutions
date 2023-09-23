import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VmsPopupComponent } from './vms-popup.component';

describe('VmsPopupComponent', () => {
  let component: VmsPopupComponent;
  let fixture: ComponentFixture<VmsPopupComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VmsPopupComponent]
    });
    fixture = TestBed.createComponent(VmsPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
