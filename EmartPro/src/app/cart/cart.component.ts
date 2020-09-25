import { Component, OnInit } from '@angular/core';
import { CartService } from '../cart.service';
import { Router } from '@angular/router';
import { Icart } from '../icart';
import { Customer } from '../customer';
import { Icustomer } from '../icustomer';
import { Iproduct } from '../iproduct';
import { Cart } from '../cart';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {

  cart : Icart;
  cartlist : Icart[];
  customer :Icustomer;
  product : Iproduct;
  constructor(private cartserv : CartService,
   public rout : Router){}

   public update(c : Cart)
   {
     this.cart = c;
     console.log(this.cart.quantity);
     console.log(this.cart.points);
     this.cartserv.putCart(this.cart,c.oid).subscribe();

   }

  public addToCart()
  {
    if(localStorage.getItem('productdetail') !== null)
    {
      this.customer = JSON.parse(sessionStorage.getItem("customer"));
      console.log('customer',this.customer);
      this.product = JSON.parse(localStorage.getItem("productdetail"));
      console.log('product',this.product);

      this.cart = new Cart(1,this.product,this.customer,1,100,false);

      this.cartserv.addToCart(this.cart).subscribe();

      localStorage.removeItem('productdetail');
    }
  }

  public remove(oid : number)
  {
    this.cartserv.deleteCart(oid).subscribe();
  }

  ngOnInit() {
    this.customer = JSON.parse(sessionStorage.getItem("customer"));
    this.addToCart();
    this.cartserv.getCart(this.customer.custid).subscribe((data)=> this.cartlist=data);
  }

}
