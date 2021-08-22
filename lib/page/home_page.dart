import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppify/login_page.dart';
import 'package:shoppify/widgets/shop_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ShopPage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong!'),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
