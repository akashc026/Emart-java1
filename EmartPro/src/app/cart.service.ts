import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Icart } from './icart';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  url = "http://localhost:8080/Emart/carts"

  constructor(private http : HttpClient) { }

  getCart(custid : number) : Observable<Icart[]> {
    return this.http.get<Icart[]>(this.url+"/"+custid);
  }

  addToCart(cart : Icart) : Observable<any>{
    return this.http.post<Icart>(this.url+"/addToCart",cart);
  }

  putCart(cart :Icart ,oid : number) : Observable<any> {
    return this.http.put<Icart>(this.url + "/update/"+oid, cart);
  }

  deleteCart(oid : number) : Observable<any> {
    return this.http.delete<Icart>(this.url + "/remove/"+oid);
  }

  deleteAllCart(custid : number) : Observable<any>{
    return this.http.delete<Icart[]>(this.url+"/removeAll/"+custid);
  }

}
