import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MetDataComponent } from './met-data.component';

describe('MetDataComponent', () => {
  let component: MetDataComponent;
  let fixture: ComponentFixture<MetDataComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MetDataComponent]
    });
    fixture = TestBed.createComponent(MetDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
