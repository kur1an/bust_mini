import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement your sign up with Google logic here
                  },
                  child: Text('Sign up with Google'),
                  style: ElevatedButton.styleFrom(
                    // Use primaryColor here
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement your login with Google logic here
                  },
                  child: Text('Login with Google'),
                  style: ElevatedButton.styleFrom(
                     // Use primaryColor here
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Or sign in with email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Implement your forgot password logic here
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement your sign in logic here
                  },
                  child: Text('Sign in'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
