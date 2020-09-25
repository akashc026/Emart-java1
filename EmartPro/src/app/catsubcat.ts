
import { Icatsubcat } from './icatsubcat';

export class Catsubcat implements Icatsubcat {
    constructor(
        public cid:number,
        public catid:number,
        public name:string,
        public flag:boolean,
        public img:string)
        {}
}
