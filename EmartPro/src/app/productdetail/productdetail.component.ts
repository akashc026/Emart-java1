import { Component, OnInit } from '@angular/core';
import { Iproduct } from '../iproduct';
import { ProductService } from '../product.service';
import { Router ,ActivatedRoute } from '@angular/router';
import {FormGroup, FormBuilder, Validators} from '@angular/forms'
import { LoginService } from '../login.service';


@Component({
  selector: 'app-productdetail',
  templateUrl: './productdetail.component.html',
  styleUrls: ['./productdetail.component.css']
})
export class ProductdetailComponent implements OnInit {

  product : Iproduct[];
  ProductFrm : FormGroup;
  submitted=false;

  constructor(private prodserv : ProductService,
    public active : ActivatedRoute,
    private rout:Router, public log : LoginService) {
     }


     checkLogin(product : Iproduct)
     {
      localStorage.setItem("productdetail" , JSON.stringify(product));
       if(this.log.isLoggedIn())
       {
         console.log(sessionStorage.getItem("productdetail"));
         console.log(sessionStorage.getItem("customer"));
         this.rout.navigate(['/cart']);
       }
       else
       {
         localStorage.setItem('goto','Hello');
         console.log(sessionStorage.getItem('goto') !== null);
         console.log(localStorage.getItem('productdetail') !== null)
         console.log(localStorage.getItem('goto'));
         this.rout.navigate(['/login']);
       }
     }

      // this.rout.navigate(['/cart']);

  ngOnInit() {
    var str = this.active.snapshot.params['str'].toString();
    this.prodserv.getProductDetails(str).subscribe((data) => this.product = data );
  }

}
