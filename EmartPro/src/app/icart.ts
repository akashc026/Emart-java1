import { Iproduct } from './iproduct';
import { Icustomer } from './icustomer';

export interface Icart {
    oid:number;
    product:Iproduct;
    customer : Icustomer;
    quantity:number;
    amount:number;
    points : boolean;
}
