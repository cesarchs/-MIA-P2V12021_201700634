import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class UsuarioService {


  private URL: String = "http://localhost:5000/api/usuario";

  constructor(private http: HttpClient) { }

  createUser(user) {
    return this.http.post(`${this.URL}/add`, user);
  }

  getAll() {
    return this.http.get(`${this.URL}/getAll`);
  }
}
