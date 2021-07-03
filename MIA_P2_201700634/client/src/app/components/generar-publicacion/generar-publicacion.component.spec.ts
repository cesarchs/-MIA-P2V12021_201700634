import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GenerarPublicacionComponent } from './generar-publicacion.component';

describe('GenerarPublicacionComponent', () => {
  let component: GenerarPublicacionComponent;
  let fixture: ComponentFixture<GenerarPublicacionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GenerarPublicacionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GenerarPublicacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
