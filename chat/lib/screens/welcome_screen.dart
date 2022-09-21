import 'package:chat/screens/login_screen.dart';
import 'package:chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  ///
  /// Used to set the route for this screen
  ///
  static const String id = 'welcome_screen';

  ///
  /// Main constructor
  ///
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  ///
  /// Controll the animations
  ///
  late AnimationController controller;

  ///
  /// Animation
  ///
  late Animation animation;

  ///
  /// Initialize the controller and the animation
  ///
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  ///
  /// Dispose the controller
  ///
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ///
  /// WelcomeScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(
              height: 48.0,
            ),
            _buildLoginButton(),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  ///
  /// Build a button for registration
  ///
  Widget _buildRegisterButton() {
    return RoundedButton(
      title: 'Register',
      colour: Colors.blueAccent,
      onPressed: () {
        Navigator.pushNamed(context, RegistrationScreen.id);
      },
    );
  }

  ///
  /// Build a button for login
  ///
  Widget _buildLoginButton() {
    return RoundedButton(
      title: 'Log In',
      colour: Colors.lightBlueAccent,
      onPressed: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
    );
  }

  ///
  /// Build a header with a logo and a title
  ///
  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Hero(
          tag: 'logo',
          child: SizedBox(
            height: 60.0,
            child: Image.asset('images/logo.png'),
          ),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flash Chat',
              textStyle: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
