import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { LoginComponent } from './login/login.component';
import { RegistrarComponent } from './components/registrar/registrar.component';
import { GenerarPublicacionComponent } from './components/generar-publicacion/generar-publicacion.component';
import { PublicacionesComponent } from './components/publicaciones/publicaciones.component';
import { ModificarpComponent } from './components/modificarp/modificarp.component';
import { AmigosComponent } from './components/amigos/amigos.component';
import { NamigosComponent } from './components/namigos/namigos.component';
import { AchatComponent } from './components/achat/achat.component';
import { NavBarComponent } from './components/nav-bar/nav-bar.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    RegistrarComponent,
    GenerarPublicacionComponent,
    PublicacionesComponent,
    ModificarpComponent,
    AmigosComponent,
    NamigosComponent,
    AchatComponent,
    NavBarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
