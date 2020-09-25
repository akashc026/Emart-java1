import { Icustomer } from './icustomer';
import { Observable } from 'rxjs';

export class Customer implements Icustomer {

    constructor(public custid:number,
        public cname:string,
        public email:string,
        public mobno:string,
        public age:number,
        public gender:string,
        public password:string,
        public address:string,
        public address1:string,
        public primemember:boolean,
        public points:number){}

        toString() : String
        {
            return this.cname;
        }
        
}
