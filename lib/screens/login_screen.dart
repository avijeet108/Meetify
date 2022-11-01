import 'package:flutter/material.dart';
import 'package:meetify/resources/auth_methods.dart';
import 'package:meetify/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Meetify',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Sign In to continue',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50),
            child: Image.asset('assets/images/onboarding.png'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authMethods.SignInWithGoogle(context);

              if (res) {
                Navigator.pushNamed(context, '/home');
              } else {}
            },
          )
        ],
      ),
    );
  }
}
