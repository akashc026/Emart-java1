import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import {tap} from 'rxjs/operators';
import { Ilogin } from './ilogin';
import { Icustomer } from './icustomer';
@Injectable({
  providedIn: 'root'
})
export class LoginService {

  Url= "http://localhost:8080/Emart/customers/";
  constructor(private http : HttpClient,private rout:Router) { }


  public UserLogin(login : Ilogin) : Observable<Icustomer[]>
  {
    return this.http.post<Icustomer[]>(this.Url + "login",login);
  }

  public UserRegister(customer : Icustomer) : Observable<any>
  {
    return this.http.post(this.Url+"register",customer);
  }

  public isLoggedIn(){
    return sessionStorage.getItem('email') !== null;

  }

  public issernavi() : Boolean
  {
    return sessionStorage.getItem('goto') === 'Hello';
  }

  public logout(){
    sessionStorage.removeItem('email');
    sessionStorage.removeItem('password');
    sessionStorage.removeItem('customer');
    this.rout.navigate(['/login']);
  }
}
