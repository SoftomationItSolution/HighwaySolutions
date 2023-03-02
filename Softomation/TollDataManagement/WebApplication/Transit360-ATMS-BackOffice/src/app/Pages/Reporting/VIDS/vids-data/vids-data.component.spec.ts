import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VidsDataComponent } from './vids-data.component';

describe('VidsDataComponent', () => {
  let component: VidsDataComponent;
  let fixture: ComponentFixture<VidsDataComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VidsDataComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VidsDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
