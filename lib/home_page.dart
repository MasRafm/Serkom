import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kpu_app/screens/entry_data.dart';
import 'package:kpu_app/screens/informasi.dart';
import 'package:kpu_app/screens/lihat_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KPU"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            //material button untuk berpindah ke page Informasi
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Informasi()));
              },
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text("Informasi"),
            ),
            const SizedBox(
              height: 30,
            ),
            //material button untuk berpindah ke page EntryData
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EntryData()));
              },
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text("Entry Data"),
            ),
            const SizedBox(
              height: 30,
            ),
            //material button untuk berpindah ke page LihatData
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LihatData()));
              },
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text("Lihat Data"),
            ),
            const SizedBox(
              height: 30,
            ),
            //material button untuk keluar aplikasi
            MaterialButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text("Keluar"),
            ),
          ],
        ),
      ),
    );
  }
}
