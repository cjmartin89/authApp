import 'package:auth_app/pages/home_page.dart';
import 'package:auth_app/pages/login_or_register_page.dart';
import 'package:auth_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          }

          // user is not logged in
          else {
            return const LoginOrRegisterPage();
          }
        }
      ),
    );
  }
}