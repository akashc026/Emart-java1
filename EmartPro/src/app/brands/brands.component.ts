import { Component, OnInit } from '@angular/core';
import { ProductService } from '../product.service';
import { ActivatedRoute } from '@angular/router';
import { Icatsubcat } from '../icatsubcat';

@Component({
  selector: 'app-brands',
  templateUrl: './brands.component.html',
  styleUrls: ['./brands.component.css']
})
export class BrandsComponent implements OnInit {

  catsubcat : Icatsubcat[];

  constructor(private prodserv : ProductService,
    public active : ActivatedRoute ) {
      
     }

     getbrand(){
      var str = this.active.snapshot.params['str'].toString();
      this.prodserv.getBrands(str).subscribe((data) => this.catsubcat = data);
    
     }

     ngDoCheck()
     {
      //  this.getbrand();
     }

  ngOnInit() {
    
    var str = this.active.snapshot.params['str'].toString();
    this.prodserv.getBrands(str).subscribe((data) => this.catsubcat = data);
  }
  
}
