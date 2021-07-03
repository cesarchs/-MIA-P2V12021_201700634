import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioService } from 'src/app/services/Usuario/usuario.service';

@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.css']
})
export class RegistrarComponent implements OnInit {

  nombre_usuario = ''
  usuario_usuario = ''
  contrasena_usuario = ''
  contrasena_usuario2 = ''
  foto_usuario_url=''


  datos = []
  constructor(private usuarioService: UsuarioService, private _routrer:Router) { }

  ngOnInit(): void {
  }
  guardar() {
    let data = {
      nombre_usuario: this.nombre_usuario,
      usuario_usuario: this.usuario_usuario,
      foto_usuario_url:this.foto_usuario_url,
      contrasena_usuario: this.contrasena_usuario
    }
    if (this.contrasena_usuario= this.contrasena_usuario2){
      this.usuarioService.createUserp(data).subscribe((res: any) => {
        if (res.status === 400) {
          console.error(res.data)
          return
        }
        console.log(res.data)
        this._routrer.navigate(['']);
      }, (err: any) => {
        console.error(err)
      })
    }
  }
}
