import 'package:flutter/material.dart';
import 'package:flutter_uas/views/Detail_page.dart';
import 'package:flutter_uas/views/Form_page.dart';
import 'package:flutter_uas/views/List_page.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: '/list',
//     routes: {
//       '/list': (context) => ListPage(),
//       '/add': ((context) => FormPage()),
//       '/detail': (context) => DetailPage(),
//     },
//   ));
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListPage(),
    );
  }
}
