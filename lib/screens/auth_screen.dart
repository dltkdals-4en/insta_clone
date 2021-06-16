import 'package:flutter/material.dart';
import 'package:insta_clone/screens/profile_screen.dart';
import 'package:insta_clone/widgets/sign_in_form.dart';
import 'package:insta_clone/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Widget signUpForm = SignUpForm();
  Widget signInForm = SignInForm();
  Widget currentWidget;

  @override
  void initState() {
    if (currentWidget == null) {
      currentWidget = signInForm;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: duration,
              child: currentWidget,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 40,
              child: Container(
                color: Colors.white,
                child: FlatButton(
                  shape: Border(
                    top: BorderSide(color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentWidget is SignUpForm) {
                        currentWidget = signInForm;
                      } else {
                        currentWidget = signUpForm;
                      }
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: (currentWidget is SignUpForm)
                          ? "Already have an account?  "
                          : "Don't have an account?  ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: (currentWidget is SignUpForm)
                              ? "Sign In"
                              : "Sign Up",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
