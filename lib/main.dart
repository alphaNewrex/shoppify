import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoppify/page/cart_page.dart';
import 'package:shoppify/page/home_page.dart';
import 'package:shoppify/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/cart': (context) => CartPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
      ),
    );
  }
}
