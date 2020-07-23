import 'package:flutter/material.dart';
import 'package:net_ninja_brew/models/brew.dart';
import 'package:net_ninja_brew/screens/home/brew_tile.dart';
import 'package:net_ninja_brew/shared/loading.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    //print(brews.documents);
    return brews == null? Loading() : ListView.builder(
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
      itemCount: brews.length,
    );
  }
}
