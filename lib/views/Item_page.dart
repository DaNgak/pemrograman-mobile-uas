import 'package:flutter/material.dart';
import '../models/Item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = ModalRoute.of(context)!.settings.arguments as Item;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/91/86/6b/91866b918c9cca0747f483a46943e926.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                        border: Border.all(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                      ),
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(bottom: 30))
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child:
                    Text("Nim : " + text.nim, style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child:
                    Text("Nama : " + text.nama, style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text("Alamat : " + text.alamat,
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text("Jenis kelamin : " + text.jeniskelamin,
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text("Tanggal Lahir : " + text.tanggallahir,
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
