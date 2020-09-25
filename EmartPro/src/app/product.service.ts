import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Iproduct } from './iproduct';
import { Icatsubcat } from './icatsubcat';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  url = "http://localhost:8080/Emart/products/";

  constructor(private http: HttpClient) { }

  public getPromotional() : Observable<Iproduct[]>{
    return this.http.get<Iproduct[]>(this.url+"promotional");
  }

  public getBrands(str : String) : Observable<Icatsubcat[]>{
    return this.http.get<Icatsubcat[]>(this.url+"brands/"+str);
  }

  public getProducts(str : String) : Observable<Iproduct[]>{
    return this.http.get<Iproduct[]>(this.url+str);
  }

  public getProductDetails(str : String) : Observable<Iproduct[]>{
    return this.http.get<Iproduct[]>(this.url+"details/"+str);
  }
}
