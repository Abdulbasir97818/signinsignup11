import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signinsignup/packages/user.dart';
import 'package:signinsignup/packages/user1.dart';

class UserSavedOne{

  static storeUser(UserOne user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    await prefs.setString('userOne', stringUser);
  }

  static Future<UserOne?> loadUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("userOne");

    if(stringUser == null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return UserOne.fromJson(map);

  }
  static Future<bool> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("userOne");
  }


}