import 'package:flutter/material.dart';
import 'package:flutter_uas/views/Home_page.dart';
import 'package:flutter_uas/views/Item_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {'/': ((context) => HomePage()), '/item': (context) => ItemPage()},
  ));
}
