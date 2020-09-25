import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutusComponent } from './aboutus/aboutus.component';
import { PagenotfoundComponent } from './pagenotfound/pagenotfound.component';
import { LoginComponent } from './login/login.component';
import { ProductsComponent } from './products/products.component';
import { BrandsComponent } from './brands/brands.component';
import { createAotCompiler } from '@angular/compiler';
import { CartComponent } from './cart/cart.component';
import { InvoiceComponent } from './invoice/invoice.component';
import { ProductdetailComponent } from './productdetail/productdetail.component';
import { RegisterComponent } from './register/register.component';
import { LogoutComponent } from './logout/logout.component';
;

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'aboutus', component: AboutusComponent},
  { path: 'login', component: LoginComponent},
  { path: 'products/:str', component : ProductsComponent},
  { path: 'brands/:str', component : BrandsComponent },
  { path: 'cart', component : CartComponent },
  { path: 'invoice', component : InvoiceComponent },
  { path: 'productdetail/:str', component : ProductdetailComponent },
  { path: 'register', component : RegisterComponent },
  { path: 'logout', component: LogoutComponent },
  { path: '**', component: PagenotfoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,{
    onSameUrlNavigation : 'reload'
  })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
