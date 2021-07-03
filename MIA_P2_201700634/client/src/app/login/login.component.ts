import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioService } from '../services/Usuario/usuario.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  NUSUARIO = ''
  CUSUARIO = ''

  datos = []
  constructor(private usuarioService: UsuarioService, private _router:Router) { }

  ngOnInit(): void {
  }

  ConsultarUsu() {
    //console.log(this.NUSUARIO)
   // console.log(this.CUSUARIO)
    let data = {
      NUSUARIO: this.NUSUARIO,
      CUSUARIO: this.CUSUARIO
    }

      this.usuarioService.buscarUser(data).subscribe((res: any) => {
        if (res.status === 400) {
          console.error(res.data)
          return
        }
        console.log(res.data[0])
        if (res.data[0]==data.NUSUARIO){
          this._router.navigate(['']);
        }
      }, (err: any) => {
        console.error(err)
      })
    }

}
