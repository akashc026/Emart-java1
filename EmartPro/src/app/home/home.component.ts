import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Iproduct } from '../iproduct';
import { ProductService } from '../product.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  product:Iproduct[];

  constructor(private productservice : ProductService) { }

  ngOnInit()
  {
    this.productservice.getPromotional().subscribe(data => this.product = data);
  }
}
