import 'package:flutter/material.dart';
import 'datetime.dart';
import 'sourcedestination.dart';
import 'login.dart'; // Import your LoginScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SourceDestinationWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Login'), // Add a Login button here
            ),
            DateTimeExample(),
          ],
        ),
      ),
    );
  }
}
