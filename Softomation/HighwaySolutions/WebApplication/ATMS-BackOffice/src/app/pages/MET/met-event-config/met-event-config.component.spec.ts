import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MetEventConfigComponent } from './met-event-config.component';

describe('MetEventConfigComponent', () => {
  let component: MetEventConfigComponent;
  let fixture: ComponentFixture<MetEventConfigComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MetEventConfigComponent]
    });
    fixture = TestBed.createComponent(MetEventConfigComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
