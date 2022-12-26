import 'package:flutter/material.dart';
import '../models/Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();
  // Initial SelectDate FLutter
  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime Final Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  final inputNim = TextEditingController();
  final inputNama = TextEditingController();
  final inputAlamat = TextEditingController();
  final inputJk = TextEditingController();
  final test = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Homepage",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Isi Biodata",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                      controller: inputNim,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nim",
                        labelText: "Nim",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                      controller: inputNama,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nama",
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                      controller: inputAlamat,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Masukkan Alamat",
                        labelText: "Alamat",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                      controller: inputJk,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Masukkan Jenis Kelamin",
                        labelText: "Jenis Kelamin",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 75),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Lahir : " +
                                  "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontSize: 16),
                            ),
                            ElevatedButton(
                              onPressed: () => {
                                _selectDate(context),
                                print(selectedDate.day +
                                    selectedDate.month +
                                    selectedDate.year)
                              },
                              child: Text('Pilih Tanggal'),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                  child: ElevatedButton(
                    child: Text("Simpan"),
                    onPressed: () {
                      test.text = inputNim.text.toString();
                    },
                  ),
                )
              ],
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.skip_next),
          onPressed: () {
            Navigator.pushNamed(context, '/item',
                arguments: Item(
                    inputNim.text.toString(),
                    inputNama.text.toString(),
                    inputAlamat.text.toString(),
                    inputJk.text.toString(),
                    "${selectedDate.toLocal()}".split(' ')[0]));
          },
        ),
      ),
    );
  }
}
