
import 'package:flutter/material.dart';

class UserOne{


  String? email;
  String? password;

  UserOne(this.email,this.password);

  UserOne.fromJson(Map<String, dynamic> json)
      : email = json['email'],
       password = json['password'];
  Map<String, dynamic> toJson() =>{
    'email' : email,
    'password' : password,
  };

}