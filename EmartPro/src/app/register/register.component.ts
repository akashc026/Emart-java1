import { Component, OnInit } from '@angular/core';
import { Customer } from '../customer';
import { Icustomer } from '../icustomer';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginService } from '../login.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  customer:Icustomer;
  registrationForm : FormGroup;
  isSubmitted = false;
  gend : String[]=['Male','Female'];

  constructor(private formBuilder: FormBuilder,private ser: LoginService ,private router: Router)
  { 
    this.registrationForm = this.formBuilder.group({

        cname: new FormControl('', [  
        Validators.required,  
        Validators.minLength(3),  
        Validators.maxLength(30),  
        Validators.pattern('^[a-zA-Z ]*$')]),
     
        email: new FormControl('', [  
          Validators.required,  
          Validators.minLength(5),  
          Validators.maxLength(80),  
          Validators.pattern("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$")  
        ]), 

        
      mobno: new FormControl('', [  
        Validators.required,  
        Validators.minLength(10),  
        Validators.maxLength(10),  
        Validators.pattern('^[0-9]*$')]), 

        age: new FormControl('', [])  ,

        gender: new FormControl('', []) ,
           
           
        address: new FormControl('', [  
          Validators.required,  
          Validators.maxLength(255)]),

        password: new FormControl('', [  
        Validators.required,  
        Validators.minLength(5),  
        Validators.maxLength(12)]),  
        
        primemember: new FormControl(),
    }
    ); 
}
onSubmit(registrationForm : FormGroup) 
    {  
      this.isSubmitted = true;  
      if(!registrationForm.valid)
      {
        return;  
      }
      this.mapFormValues(registrationForm);
      this.postdata(this.customer);      
      console.log("User Registration Form Submit", this.registrationForm.value);  
      
    }

      
    
      mapFormValues(registrationForm: FormGroup) 
      {
        this.customer = new Customer (0,"","","",0,"","","","",false,0 );
        this.customer.cname = registrationForm.controls.cname.value;
        this.customer.email = registrationForm.controls.email.value;
        this.customer.mobno = registrationForm.controls.mobno.value;
        this.customer.age = registrationForm.controls.age.value;
        this.customer.gender = registrationForm.controls.gender.value;
        this.customer.password = registrationForm.controls.password.value;
        this.customer.address = registrationForm.controls.address.value;
        this.customer.primemember = registrationForm.controls.primemember.touched;
      }

  ngOnInit() {
  }

  postdata(cust) {
    this.ser.UserRegister(cust).subscribe((data) => {
      if(data){
        this.router.navigate(['/login']);
      }
   });
   }

}
