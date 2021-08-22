import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: FloatingActionButton.extended(
        onPressed: () {
          
        },
        label: Text('Sign in with Google'),
        icon: FaIcon(
          FontAwesomeIcons.google,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      )),
    );
  }
}
