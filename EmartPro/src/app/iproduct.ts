import { Catsubcat } from './catsubcat';

export interface Iproduct {
    id:number;
      catsubcat:Catsubcat;
	  name:string;
	  pdetail:string;
	  points:number;
	  price:number;
	  primeprice:number;
	  image:string;
	  modelno:string;
	  cgst:number;
	  sgst:number;
	  promotional:boolean;
}
