import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final CollectionReference _firestore =
    FirebaseFirestore.instance.collection('users');

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String dowloadUrl = await snapshot.ref.getDownloadURL();
    return dowloadUrl;
  }

  Future<String> saveData(
      {required String nik,
      required String nama,
      required String nohp,
      required String jk,
      required String tgl,
      required String almt,
      required Uint8List file}) async {
    String resp = "Error";

    try {
      if (nik.isNotEmpty ||
          nama.isNotEmpty ||
          nohp.isNotEmpty ||
          jk.isNotEmpty ||
          tgl.isNotEmpty ||
          almt.isNotEmpty) {
        String imageUrl = await uploadImageToStorage('files/', file);
        Map<String, dynamic> dataToAdd = {
          'Nik': nik,
          'Nama': nama,
          'NoHp': nohp,
          'Jenis Kelamin': jk,
          'Tanggal': tgl,
          'Alamat': almt,
          'imageLink': imageUrl
        };

        QuerySnapshot querySnapshot =
            await _firestore.where('Nik', isEqualTo: nik).get();

        if (querySnapshot.docs.isEmpty) {
          _firestore.add(dataToAdd);
          print('Berhasil Mendaftar');
        } else {
          print('Nik sudah terdaftar');
          // ignore: non_constant_identifier_names
        }

        /*
        await _firestore.collection('users').add({
          'Nik': nik,
          'Nama': nama,
          'NoHp': nohp,
          'Jenis Kelamin': jk,
          'Tanggal': tgl,
          'Alamat': almt,
          'imageLink': imageUrl
        });
*/
        resp = 'Sukses';
      }
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
