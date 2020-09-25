import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { CartService } from '../cart.service';
import { Icart } from '../icart';
import { Icustomer } from '../icustomer';
import * as jsPDF from 'jspdf';
import { Content } from '@angular/compiler/src/render3/r3_ast';
import { Router } from '@angular/router';

@Component({
  selector: 'app-invoice',
  templateUrl: './invoice.component.html',
  styleUrls: ['./invoice.component.css']
})
export class InvoiceComponent implements OnInit {

  cartlist : Icart[];
  Total : number = 0;
  custid:number;
  customer : Icustomer;
  i : number = 1001;
  @ViewChild('content') Content : ElementRef;
  

  constructor(private cartserv : CartService, private rout : Router) {  }

  public pay()
  {
    let doc = new jsPDF('p','mm','a4');
    let specialElementHandlers = {
      '#editor':function(element,renderer) {
        return true;
      }
    };

    let content = this.Content.nativeElement;

    doc.fromHTML(content.innerHTML, 15, 15, {
      'width':190,
      'elementHandlers':specialElementHandlers
    });

    doc.save('invoice.pdf');

    this.cartserv.deleteAllCart(this.custid).subscribe();
    this.rout.navigate(['']);
  }

  public countTotal()
  {
    this.cartlist.forEach(element => {
      this.Total = this.Total + element.amount;
    });
    console.log(this.Total);
  }

  ngOnInit() {
    this.customer = JSON.parse(sessionStorage.getItem("customer"));
    this.cartserv.getCart(this.customer.custid).subscribe((data)=> 
    {
      this.cartlist=data
	  
      this.cartlist.forEach(element => {
        this.Total = this.Total + element.amount;
        this.custid = element.customer.custid;
      });
    }
    );
  }

}
