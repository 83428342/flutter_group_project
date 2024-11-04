import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSettingBox(context, 'Theme', ThemePage()),
          buildSettingBox(context, 'Character setting', CharacterSettingPage()),
          buildSettingBox(context, 'Privacy', PrivacyPage()),
          buildSettingBox(context, 'Customer Service', CustomerServicePage()),
          buildSettingBox(context, 'Version', VersionPage()),
        ],
      ),
    );
  }

  Widget buildSettingBox(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme')),
      body: Center(child: Text('Theme Settings', style: TextStyle(fontSize: 25))),
    );
  }
}

class CharacterSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Setting')),
      body: Center(
          child: Text(
              'Character Settings',
              style: TextStyle(fontSize: 25)
          )
      ),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy')),
      body: Center(child: Text('Privacy Settings', style: TextStyle(fontSize: 25))),
    );
  }
}

class CustomerServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Service')),
      body: Center(child: Text('Customer Service', style: TextStyle(fontSize: 25))),
    );
  }
}

class VersionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Version')),
      body: Center(child: Text('Version 1.0.0', style: TextStyle(fontSize: 25))),
    );
  }
}
