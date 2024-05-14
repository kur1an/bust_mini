// login_screen.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle() async {
    // Obtain the Google authentication token (implementation not shown)
    String googleAuthToken = 'YOUR_GOOGLE_AUTH_TOKEN';

    // Replace 'YOUR_SERVER_URL' with the actual URL of your Node.js server
    final response = await http.post(
      Uri.parse('http://localhost:3000/google-auth'), // Corrected URL
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': googleAuthToken}),
    );

    if (response.statusCode == 200) {
      // Authentication successful, handle the response from the server
      // For example, navigate to the home screen
    } else {
      // Authentication failed, handle the error
      print('Authentication failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
