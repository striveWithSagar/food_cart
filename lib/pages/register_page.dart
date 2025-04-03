import 'package:flutter/material.dart';
import 'package:food_cart/components/custome_buttons.dart';
import 'package:food_cart/components/textfields.dart';
import 'package:food_cart/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,

  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text Editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //register method
  void register() async{

    //fill out authentication here......
    final _authService = AuthService();

    //check if password match -> create user
    if(passwordController.text == confirmPasswordController.text){
      //try creating user
      try{
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }

      //display any errors
      catch(e){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text(e.toString()),
            )
        );
      }
    }
    //if passwod dont match
    else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text("Password don't match"),
          )
      );
    }
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


            //CONFIRM button
            const SizedBox(height: 10,),

            //password textField
            MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true
            ),

            //sign-in button
            const SizedBox(height: 25,),

            MyButton(
              text: 'Sign-Up',
              onTap: register,
            ),

            const SizedBox(height: 25,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,

                  ),
                ),
                const SizedBox(width: 9,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login now",
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
