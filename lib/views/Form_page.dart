import 'package:flutter/material.dart';
import 'package:flutter_uas/database/dbhelper.dart';
import 'package:flutter_uas/models/biodata.dart';

class FormPage extends StatefulWidget {
  final Biodata? biodata;

  const FormPage({super.key, this.biodata});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  DbHelper db = DbHelper();

  TextEditingController? name;
  TextEditingController? nim;
  TextEditingController? alamat;
  TextEditingController? jenisKelamin;
  TextEditingController? date;

  @override
  void initState() {
    name = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.name);

    nim = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.nim);

    alamat = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.alamat);

    jenisKelamin = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.jenisKelamin);
    date = TextEditingController(
        text: widget.biodata == null ? '' : widget.biodata!.date);

    super.initState();
  }

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

  Future<void> upsertBiodata() async {
    if (widget.biodata != null) {
      //update
      await db.updateBiodata(Biodata(
          id: widget.biodata!.id,
          name: name!.text,
          nim: nim!.text,
          alamat: alamat!.text,
          jenisKelamin: jenisKelamin!.text,
          date: "${selectedDate.toLocal()}".split(' ')[0].toString()));
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveBiodata(Biodata(
          name: name!.text,
          nim: nim!.text,
          alamat: alamat!.text,
          jenisKelamin: jenisKelamin!.text,
          date: "${selectedDate.toLocal()}".split(' ')[0].toString()));
      Navigator.pop(context, 'save');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Tambah Data"),
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
                      controller: nim,
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
                      controller: name,
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
                      controller: alamat,
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
                      controller: jenisKelamin,
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
                    child: Text("Tambah Data"),
                    onPressed: () {
                      upsertBiodata();
                    },
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
