import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart' as gmail;
import 'package:googleapis_auth/auth.dart' as auth;

const Color primaryColor = Colors.blue;

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _currentUser;

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
                  onPressed: _handleGoogleSignIn,
                  child: Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleGoogleSignUp,
                  child: Text('Sign up with Google'),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
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

  void _handleGoogleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      if (_currentUser != null) {
        _getUserEmail();
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to sign in with Google')));
    }
  }

  void _handleGoogleSignUp() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      if (_currentUser != null) {
        _getUserEmail();
        // Perform additional sign-up logic here
      }
    } catch (error) {
      print('Error signing up with Google: $error');
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to sign up with Google')));
    }
  }

  void _getUserEmail() async {
    if (_currentUser != null) {
      // Get the OAuth token
      auth.GoogleSignInAuthentication googleAuth = await _currentUser!.authentication;
      auth.AccessCredentials credentials = auth.AccessCredentials(
        accessToken: googleAuth.accessToken,
        refreshToken: googleAuth.refreshToken,
        idToken: googleAuth.idToken,
        tokenEndpoint: auth.TokenEndpoint('https://oauth2.googleapis.com/token', 'dummy'),
      );

      // Initialize the Gmail API client
      var client = auth.autoRefreshingClient(credentials);

      // Get the user's email address
      gmail.GmailApi gmailApi = gmail.GmailApi(client);
      gmail.Profile profile = await gmailApi.users.getProfile('me');
      print('Email address: ${profile.emailAddress}');
    }
  }
}
