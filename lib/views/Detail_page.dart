import 'package:flutter/material.dart';
import 'package:flutter_uas/database/dbhelper.dart';
import 'package:flutter_uas/models/biodata.dart';
import 'package:flutter_uas/views/List_page.dart';

class DetailPage extends StatefulWidget {
  final Biodata biodata;
  const DetailPage({Key? key, required this.biodata}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Biodata"),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                child: Text("Nim : " + widget.biodata.nim!.toString(),
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text("Nama : " + widget.biodata.name!.toString(),
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text("Alamat : " + widget.biodata.alamat!.toString(),
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                    "Jenis kelamin : " +
                        widget.biodata.jenisKelamin!.toString(),
                    style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                    "Tanggal Lahir : " + widget.biodata.date!.toString(),
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ListPage();
                }),
              );
            },
            child: Icon(Icons.keyboard_arrow_left)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
