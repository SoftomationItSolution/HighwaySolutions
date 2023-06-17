import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VidsdataComponent } from './vidsdata.component';

describe('VidsdataComponent', () => {
  let component: VidsdataComponent;
  let fixture: ComponentFixture<VidsdataComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VidsdataComponent]
    });
    fixture = TestBed.createComponent(VidsdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
