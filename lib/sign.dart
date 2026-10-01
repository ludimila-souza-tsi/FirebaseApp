import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignPage extends StatefulWidget {
 const SignPage({super.key});

 @override
 State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
 final emailText = TextEditingController();
 final passwordText = TextEditingController();
 final confirmText = TextEditingController();

 bool loading = false;
 String? message;
 bool obscure = true;

 @override
 void dispose() {
   emailText.dispose();
   passwordText.dispose();
   confirmText.dispose();
   super.dispose();
 }

 Future<void> _signUp() async {
   final email = emailText.text.trim();
   final password = passwordText.text;
   final confirm = confirmText.text;

   if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
     setState(() => message = 'Preencha e-mail, senha e confirmação.');
     return;
