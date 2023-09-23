import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VmsDataComponent } from './vms-data.component';

describe('VmsDataComponent', () => {
  let component: VmsDataComponent;
  let fixture: ComponentFixture<VmsDataComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VmsDataComponent]
    });
    fixture = TestBed.createComponent(VmsDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
