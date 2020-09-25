import { Icart } from './icart';
import { Iproduct } from './iproduct';
import { Icustomer } from './icustomer';

export class Cart implements Icart {
    constructor(
    public oid:number,
    public product:Iproduct,
    public customer:Icustomer, 
    public quantity:number,
    public amount:number,
    public points:boolean
    ){}
}
