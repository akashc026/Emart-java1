import { Component, OnInit } from '@angular/core';
import { LoginService } from '../login.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css']
})
export class LogoutComponent implements OnInit {

  constructor(private logout : LoginService,
    private rout : Router) { }

  ngOnInit() {
    this.logout.logout();
    // console.log(sessionStorage.getItem("customer"));
    this.rout.navigate(['']);
  }

}
