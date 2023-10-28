import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LihatData extends StatefulWidget {
  const LihatData({super.key});

  @override
  State<LihatData> createState() => _LihatDataState();
}

class _LihatDataState extends State<LihatData> {
  final _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lihat Data"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          //koneksi firestore
          stream: _userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("konesi eror");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //mengambil data dari firestore
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 5,
                        child: Text(
                          "Nama : ${docs[index]['Nama']}",
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "NIK : ${docs[index]['Nik']}",
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("No.HP : ${docs[index]['NoHp']}",
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Jenis Kelamin : ${docs[index]['Jenis Kelamin']}",
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Tanggal : ${docs[index]['Tanggal']}",
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Alamat : ${docs[index]['Alamat']}",
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Gambar : ",
                              style: TextStyle(fontSize: 24)),
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Image.network(
                              '${docs[index]['imageLink']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
