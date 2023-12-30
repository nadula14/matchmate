import 'package:flutter/material.dart';
import 'package:matchmate/components/main_button.dart';
import 'package:matchmate/screens/userdetails1.dart';
import '../components/textfield.dart';
import '../components/appbar.dart';
import '../components/image.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const MainImage(),
            const SizedBox(
              height: 50,
            ),
            reusableTextField('Enter Your Username', false, usernameController,
                "Enter Your Username"),
            const SizedBox(
              height: 30,
            ),
            reusableTextField(
                'Enter Your Email', false, emailController, "Enter Your Email"),
            const SizedBox(
              height: 30,
            ),
            reusableTextField('Enter Your Password', true, passwordController,
                "Enter Your Password"),
            const SizedBox(
              height: 30,
            ),
            MainButton(
              text: "Next",
              onPress: () async {
                // try {
                //   // Create user with Firebase authentication
                //   await FirebaseAuth.instance
                //       .createUserWithEmailAndPassword(
                //     email: emailController.text,
                //     password: passwordController.text,
                //   );

                  // Navigate to Userdetails1 after successful user creation
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Userdetails1()),
                  );
              //   } catch (error) {
              //     // Handle any errors that occur during user creation
              //     print("Error creating user: $error");
              //     // You can also show an error message to the user
              //     // For example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error creating user")));
              //   }
               },
            ),
          ],
        ),
      ),
    );
  }
}
