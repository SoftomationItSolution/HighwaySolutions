import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IncidentDataComponent } from './incident-data.component';

describe('IncidentDataComponent', () => {
  let component: IncidentDataComponent;
  let fixture: ComponentFixture<IncidentDataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IncidentDataComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IncidentDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
