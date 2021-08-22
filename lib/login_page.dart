import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';
import 'package:shoppify/provider/google_sign_in_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Center(
        child: Container(
            child: FloatingActionButton.extended(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          label: Text('Sign in with Google'),
          icon: FaIcon(
            FontAwesomeIcons.google,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )),
      ),
    );
  }
}
