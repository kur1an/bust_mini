import 'package:flutter/material.dart';
import 'datetime.dart';
import 'login.dart';

class SourceDestinationWidget extends StatefulWidget {
  @override
  _SourceDestinationWidgetState createState() => _SourceDestinationWidgetState();
}

class _SourceDestinationWidgetState extends State<SourceDestinationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Enter Source'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter Destination'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement your search buses logic here
          },
          child: const Text('Search Buses'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: DateTimeExample(),
                );
              },
            );
          },
          child: const Text('Select Date and Time'),
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          // Add other settings items here
        ],
      ),
    );
  }
}