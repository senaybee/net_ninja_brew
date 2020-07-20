import 'package:flutter/material.dart';
import 'package:net_ninja_brew/models/user.dart';
import 'package:net_ninja_brew/screens/authenticate/authenticate.dart';
import 'package:net_ninja_brew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //Return either Home or Authenticate widget;
    return Authenticate();
  }
}
