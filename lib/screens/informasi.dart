import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  const Informasi({super.key});

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infomasi"),
        centerTitle: true,
      ),
      body: const Center(
          child: Text(
        "version 1.0.0",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
