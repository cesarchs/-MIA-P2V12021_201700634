import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NamigosComponent } from './namigos.component';

describe('NamigosComponent', () => {
  let component: NamigosComponent;
  let fixture: ComponentFixture<NamigosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NamigosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NamigosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
