import { Ilogin } from './ilogin';

export class Login implements Ilogin {
    constructor(
        public email:String,
        public password : String
    ){}
}
