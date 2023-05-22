
import 'package:flutter/material.dart';

 class User{

   String? fullname;
   String? email;
   String? phone;
   String? password;

   User(this.fullname,this.email,this.phone,this.password);

   User.fromJson(Map<String, dynamic> json)
   : fullname = json['fullname'],
         email = json['email'],
         phone = json['phone'],
         password = json['password'];
   Map<String, dynamic> toJson() =>{
     'fullname' : fullname,
     'email' : email,
     'phone' : phone,
     'password' : password,
   };

}