import { Component, OnInit } from '@angular/core';
import { Iproduct } from '../iproduct';
import { ProductService } from '../product.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {

  product : Iproduct[];
  constructor(private prodserv : ProductService,
    public active : ActivatedRoute) { }

  ngOnInit() {
    var str = this.active.snapshot.params['str'].toString();
    this.prodserv.getProducts(str).subscribe((data) => this.product = data );
  }

}
