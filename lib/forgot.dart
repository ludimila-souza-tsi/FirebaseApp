import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPage extends StatefulWidget {
 const ForgotPage({super.key});
 @override
 State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
 final emailText = TextEditingController();
 bool loading = false;
 String? message;

 @override
 void dispose() {
   emailText.dispose();
   super.dispose();
 }

 Future<void> _sendReset() async {
   final email = emailText.text.trim();
   if (email.isEmpty) {
     setState(() => message = 'Informe seu e-mail.');
     return;
   }

   setState(() {
     loading = true;
     message = null;
   });

   try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     setState(
