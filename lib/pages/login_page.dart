import 'package:flutter/material.dart';
import 'package:food_cart/components/custome_buttons.dart';
import 'package:food_cart/components/textfields.dart';

import '../services/auth/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,

  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text Editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login(){

    //fill out authentication here....
    void login() async{
      final _authService = AuthService();

      try{
        await _authService.signInWithEmailPassword(
            emailController.text,
            passwordController.text
        );
      }
      catch(e){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            )
        );
      }
    }

      //fill out authentication here......







    //navigate to home page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25,),

            //message, app slogan

            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25,),

            //email textField
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false
            ),


            const SizedBox(height: 10,),

            //password textField
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true
            ),


            //sign-in button
            const SizedBox(height: 25,),

            MyButton(
                text: 'Sign-in',
                onTap: login ,
            ),

            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,

                ),
                ),
                const SizedBox(width: 9,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register now",
                      style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
