import { Component, OnInit } from '@angular/core';
import { UsuarioService } from '../../services/Usuario/usuario.service'
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  id = ''
  nombre = ''
  usuario = ''

  datos = []
  constructor(private usuarioService: UsuarioService) { }

  ngOnInit(): void {
    this.getAll()
  }


  guardar() {
    let data = {
      nombre: this.nombre,
      usuario: this.usuario
    }

    this.usuarioService.createUser(data).subscribe((res: any) => {
      if (res.status === 400) {
        console.error(res.data)
        return
      }
      console.log('llego aca XD')
      console.log(res.data)
      this.getAll()
      this.nombre = ''
      this.usuario = ''
    }, (err: any) => {
      console.error(err)
    })
  }

  getAll() {
    this.usuarioService.getAll().subscribe((res: any) => {
      if (res.status === 400) {
        console.error(res.data)
        return
      }
      console.log(res.data)
      this.datos = res.data
      this.nombre = ''
      this.usuario = ''
    }, (err: any) => {
      console.error(err)
    })
  }

}
