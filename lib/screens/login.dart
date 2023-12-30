import 'package:flutter/material.dart';
import 'package:matchmate/components/main_button.dart';
import 'package:matchmate/components/textfield.dart';
import 'package:matchmate/screens/landing_page.dart';
import '../components/appbar.dart';
import '../components/image.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
   
 
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
 

    return Scaffold(
       backgroundColor: Colors.white,
      appBar: const Appbar(),
       body: Padding(
      
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const MainImage(),

            const SizedBox(height: 50,),

            reusableTextField('Enter Your Username', false, usernameController, "Enter Your Username"), 
            
            const SizedBox(height: 30,),
            
            reusableTextField('Enter Your Password', true, passwordController, "Enter Your Password"),
            
            const SizedBox( height: 30,),
           
         MainButton(text: "LOGIN", onPress: (){
          FirebaseAuth.instance.signInWithEmailAndPassword(
            email: usernameController.text,
            password: passwordController.text)
            .then((signedUser) => 
            {
               Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const LandingPage()))
            });

         
         })
        
          ],
        ),
      ),
    

    );
  }
}

