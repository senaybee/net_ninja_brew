import 'package:flutter/material.dart';
import 'package:net_ninja_brew/models/brew.dart';
import 'package:net_ninja_brew/screens/home/brew_list.dart';
import 'package:net_ninja_brew/screens/home/settings_form.dart';
import 'package:net_ninja_brew/services/auth.dart';
import 'package:net_ninja_brew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _showSettingsPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(context),
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            )
          ],
        ),
        body: Container(
          child: BrewList(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/coffee_bg.png',
                ),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
