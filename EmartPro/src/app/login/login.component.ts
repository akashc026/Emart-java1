import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { LoginService } from '../login.service';
import { Router } from '@angular/router';
import { Icustomer } from '../icustomer';
import { Ilogin } from '../ilogin';
import { Login } from '../login';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  log : Ilogin;
  customer : Icustomer[] ;
  loginForm: FormGroup;
  isSubmitted  =  false;
  temp:boolean;
  cust : Icustomer;

  constructor(private loginService: LoginService , private router: Router, private formBuilder: FormBuilder) { }

  ngOnInit() {
    sessionStorage.removeItem('email');    
    sessionStorage.clear();
     
    this.loginForm  =  this.formBuilder.group({
      email : ['', Validators.required],
      password : ['', Validators.required]
  });
  }
    
  userlogin()
    {  
    this.log = new Login("","");
    this.log.email = this.loginForm.controls.email.value;
    this.log.password = this.loginForm.controls.password.value; 
    
    this.loginService.UserLogin(this.log).subscribe((data) => {
      console.log(data);
      if(data)
      {
        this.customer = data;
        this.customer.forEach(element => {
          this.cust=element;          
        });
        sessionStorage.setItem("email",this.loginForm.value.email);
        sessionStorage.setItem("password",this.loginForm.value.password);
        sessionStorage.setItem("customer",JSON.stringify(this.cust));
        console.log(sessionStorage.getItem("email"));
        console.log(sessionStorage.getItem("customer"));
        if(localStorage.getItem('goto') !== null)
        {
          console.log(localStorage.getItem('goto') !== null);
         
          localStorage.removeItem('goto');
          this.router.navigateByUrl('/cart');
        }
        else
        {
          console.log(localStorage.getItem('goto') !== null);
         
          this.router.navigateByUrl('');
        }
      }
      else
      {
        this.router.navigateByUrl('/login');
      }
   });

  }
}
