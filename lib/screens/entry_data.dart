import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpu_app/resources/up_data.dart';
import 'package:kpu_app/lokasi/lokasi.dart';
import 'package:kpu_app/utils.dart';

class EntryData extends StatefulWidget {
  const EntryData({super.key});

  @override
  State<EntryData> createState() => _EntryDataState();
}

class _EntryDataState extends State<EntryData> {
  //controller untuk menyimpan data dari TextField
  Uint8List? _image;
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final nohpController = TextEditingController();
  final jkController = TextEditingController();
  final tglController = TextEditingController();
  final almtController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
      if (_image == null) return;
    });
  }

  void saveData() async {
    String nik = nikController.text;
    String nama = namaController.text;
    String nohp = nohpController.text;
    String jk = jkController.text;
    String tgl = tglController.text;
    String almt = almtController.text;

    // ignore: unused_local_variable
    String resp = await StoreData().saveData(
        nik: nik,
        nama: nama,
        nohp: nohp,
        jk: jk,
        tgl: tgl,
        almt: almt,
        file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    //membuat instance firestore database

    return Scaffold(
      appBar: AppBar(
        title: const Text("Entry Data"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //TextField untuk input data Nik
                  TextField(
                    controller: nikController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'NIK',
                        hintText: 'Masukan NIK'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //TextField untuk input data Nama
                  TextField(
                    controller: namaController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama',
                        hintText: 'Masukan Nama'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //TextField untuk input data NoHP
                  TextField(
                    controller: nohpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'No.HP',
                        hintText: 'Masukan Nomor HP'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //TextField untuk input data Jenis Kelamin
                  TextField(
                    controller: jkController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Jenis Kelamin',
                        hintText: 'L/P'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //TextField untuk input data Tanggal
                  TextField(
                    controller: tglController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tanggal',
                        hintText: 'Masukan Tanggal'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //TextField untuk input data Alamat
                  TextField(
                    controller: almtController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Alamat',
                        hintText: 'Masukan Alamat'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Lokasi()));
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    minWidth: 300,
                    height: 40,
                    child: const Text("Lokasi"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: selectImage,
                        child: const Text("Gambar"),
                      ),
                      Stack(
                        children: [
                          _image != null
                              ? Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Image.memory(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: const Icon(Icons.add_a_photo),
                                )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //MaterialButton untuk menyimpan data ke firestore database
                  MaterialButton(
                    onPressed: () {
                      saveData();
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    minWidth: 300,
                    height: 40,
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
