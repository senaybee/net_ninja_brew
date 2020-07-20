import 'package:flutter/material.dart';
import 'package:net_ninja_brew/screens/authenticate/authenticate.dart';
import 'package:net_ninja_brew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Return either Home or Authenticate widget;
    return Authenticate();
  }
}
