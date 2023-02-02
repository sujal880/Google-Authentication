import 'package:flutter/material.dart';
import 'package:google_auth/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goggle Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    Auth.signInWithGoogle();
                  }, child: Text("Sign In With Google")),
            ),
          )
        ],
      ),
    );
  }
}
