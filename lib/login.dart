import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign.dart';
import 'forgot.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({super.key});
 @override
 State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final emailText = TextEditingController();
 final passwordText = TextEditingController();
 bool loading = false;
 String? message;

 @override
 void dispose() {
   emailText.dispose();
   passwordText.dispose();
   super.dispose();
 }

 Future<void> _login() async {
   final email = emailText.text.trim();
   final password = passwordText.text;
   if (email.isEmpty || password.isEmpty) {
     setState(() => message = 'Preencha e-mail e senha.');
     return;
   }
   setState(() {
     loading = true;
     message = null;
   });
