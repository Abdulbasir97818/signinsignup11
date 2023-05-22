import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signinsignup/packages/signuppage.dart';
import 'package:signinsignup/packages/user1.dart';
import 'package:signinsignup/packages/util1.dart';


class SignInPage extends StatefulWidget {
  static String id = "sign_in_page";
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  doLogin(){

    String email = emailController.text;
    String password = passwordController.text;

    if(
        email.isNotEmpty &&
        password.isNotEmpty
    ){
      var user = UserOne(email,password);
      UserSavedOne.storeUser(user);
      UserSavedOne.loadUser().then((value) =>{
        print(value)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/image.png"),
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              const SizedBox(height: 10,),
              const Text("Log in to your existant account of Q Allure",style: TextStyle(fontSize: 14,color: Colors.grey),),
              // TextField #email
              Container(
                margin: const EdgeInsets.only(left: 20,right: 20,top: 15),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white,
                ),
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.bold),
                  decoration:  const InputDecoration(
                    //icon: Icon(Icons.person),
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    contentPadding: EdgeInsets.all(17.0),
                    enabledBorder: InputBorder.none,
                    border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(23))),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Email",
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
                    hintText: "password",
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              // Forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text("Forgot password?",style: TextStyle(color: Colors.black), ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
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
              const SizedBox(height: 50,),
              const Text("or connect using",style: TextStyle(color: Colors.grey,)),
              const SizedBox(height: 15,),
              //#facebook #google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 40,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[900]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("f",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 10,),
                        Text("Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 40,
                    width: 130,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("G",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(width: 10,),
                        Text("Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 70,),
              //account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignUpPage.id);

                    },
                    child: Text("Sign up" , style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                  )
                ],
              )
              

            ],
          ),
    );
  }
}
