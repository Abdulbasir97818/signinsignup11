import 'package:flutter/material.dart';
import 'package:signinsignup/packages/signinpage.dart';
import 'package:signinsignup/packages/user.dart';
import 'package:signinsignup/packages/util.dart';


class SignUpPage extends StatefulWidget {
  static String id = "sign_up_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController fullnameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmPasswordController =  TextEditingController();

  doLogin(){
    String fullname = fullnameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    String cPassword = confirmPasswordController.text;

    if(fullname.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty &&
        password.isNotEmpty &&
        cPassword.isNotEmpty ){
      var user = User(fullname,email,phone,password);
      UserSaved.storeUser(user);
      UserSaved.loadUser().then((value) =>{
        print(value)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: const [
              Icon(Icons.arrow_back,color: Colors.black,)
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(height: 30,),
          const Text("Lets get started!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          const SizedBox(height: 10,),
          const Text("Create an account of Q Allure to get all features",style: TextStyle(fontSize: 14,color: Colors.grey),),
          // TextField #fullname
          const SizedBox(height: 30,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: TextField(
              controller: fullnameController,
              style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
              decoration:  const InputDecoration(
                //icon: Icon(Icons.person),
                prefixIcon: Icon(Icons.person_outline_outlined),
                contentPadding: EdgeInsets.all(17.0),
                enabledBorder: InputBorder.none,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Fullname",
              ),
            ),
          ),
          const SizedBox(height: 10,),
          // TextField #email
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: TextField(
              controller: emailController,
              style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
              decoration:  const InputDecoration(
                //icon: Icon(Icons.person),
                prefixIcon: Icon(Icons.email_outlined),
                contentPadding: EdgeInsets.all(17.0),
                enabledBorder: InputBorder.none,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Email",
              ),
            ),
          ),
          const SizedBox(height: 10,),
          // TextField #phones
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: TextField(
              controller: phoneController,
              style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
              decoration:  const InputDecoration(
                //icon: Icon(Icons.person),
                prefixIcon: Icon(Icons.phone_iphone),
                contentPadding: EdgeInsets.all(17.0),
                enabledBorder: InputBorder.none,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Phone",
              ),
            ),
          ),
          // TextField #password
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: TextField(
              controller: passwordController,
              style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
              decoration:  const InputDecoration(
                //icon: Icon(Icons.person),
                prefixIcon: Icon(Icons.lock_open_outlined),
                contentPadding: EdgeInsets.all(17.0),
                enabledBorder: InputBorder.none,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Password",
              ),
            ),
          ),
          // TextField #password
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: TextField(
              controller: confirmPasswordController,
              style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
              decoration:  const InputDecoration(
                //icon: Icon(Icons.person),
                prefixIcon: Icon(Icons.lock_open_outlined),
                contentPadding: EdgeInsets.all(17.0),
                enabledBorder: InputBorder.none,
                border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Confirm password",
              ),
            ),
          ),
          const SizedBox(height: 40,),
          // Forget password

          // #login button
          GestureDetector(

            onTap: (){
              doLogin();
            },
            child: Container(
              width: 180,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.blue[800]
              ),
              child: const Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            ),
          ),
          const SizedBox(height: 30,),
          const SizedBox(height: 70,),
          //account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?",),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                },
                child: const Text("Log in here" , style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
              )
            ],
          ),


        ],
      ),

    );
  }
}
