import 'package:chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  ///
  /// Used to set the route for this screen
  ///
  static const String id = 'login_screen';

  ///
  /// Main constructor
  ///
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///
  /// Used to controll the [ModalProgressHUD]
  ///
  bool showSpinner = false;

  ///
  /// Firebase instance
  ///
  final _auth = FirebaseAuth.instance;

  ///
  /// Used to save the email
  ///
  String email = '';

  ///
  /// Used to save the password
  ///
  String password = '';

  ///
  /// LoginScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogo(),
            const SizedBox(
              height: 48.0,
            ),
            _buildEmailTextField(),
            const SizedBox(
              height: 8.0,
            ),
            _buildPasswordTextField(),
            const SizedBox(
              height: 24.0,
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  ///
  /// Build a submit button for log in
  ///
  Widget _buildSubmitButton() {
    return RoundedButton(
      title: 'Log In',
      colour: Colors.lightBlueAccent,
      onPressed: () async {
        setState(() {
          showSpinner = true;
        });

        final user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (user.user != null) {
          Navigator.pushNamed(context, ChatScreen.id);

          setState(() {
            showSpinner = false;
          });
        }
      },
    );
  }

  ///
  /// Build a text field for enter the password
  ///
  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      textAlign: TextAlign.center,
      onChanged: (value) {
        password = value;
      },
      decoration:
          kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
    );
  }

  ///
  /// Build a text field for enter the email
  ///
  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      onChanged: (value) {
        email = value;
      },
      decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
    );
  }

  ///
  /// Build a logo
  ///
  Widget _buildLogo() {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: SizedBox(
          height: 200.0,
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
