import { Icart } from './icart';

export interface Iinvoice {
    iid:number;
    cart:Icart;
    amount:number;
}
