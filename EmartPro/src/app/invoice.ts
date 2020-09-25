import { Iinvoice } from './iinvoice';
import { Icart } from './icart';

export class Invoice  implements Iinvoice{
    constructor(
        public iid : number,
        public cart : Icart,
        public amount : number
    ){}
}
