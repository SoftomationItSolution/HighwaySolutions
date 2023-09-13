import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportMasterComponent } from './ReportMasterComponent';

describe('ReportMasterComponent', () => {
  let component: ReportMasterComponent;
  let fixture: ComponentFixture<ReportMasterComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ReportMasterComponent]
    });
    fixture = TestBed.createComponent(ReportMasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
