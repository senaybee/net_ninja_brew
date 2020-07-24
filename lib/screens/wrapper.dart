import 'package:flutter/material.dart';
import 'package:net_ninja_brew/models/user.dart';
import 'package:net_ninja_brew/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
      
    } else {
      return Home();
    }
  }
}
