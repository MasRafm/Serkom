import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Lokasi extends StatefulWidget {
  const Lokasi({super.key});

  @override
  State<Lokasi> createState() => _LokasiState();
}

class _LokasiState extends State<Lokasi> {
  String result = "";
  String lat = "";
  String lng = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          displayLocation(),
          _getMapButton(),
          const SizedBox(
            height: 20,
          ),
          _getLocationButton()
        ],
      ),
    );
  }

  Widget _getMapButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
        onPressed: () {
          gotoMap();
        },
        child: const Text(
          "Pergi ke Map",
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _getLocationButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(300, 50)),
        onPressed: () {
          getUserLocation();
        },
        child: const Text(
          "Get Location",
          style: TextStyle(fontSize: 20),
        ));
  }

  //cek perijinan bila sudah aktif
  Future<bool> checkPermission() async {
    bool isEnable = false;
    LocationPermission permission;

    //cek jika gps enable
    isEnable = await Geolocator.isLocationServiceEnabled();
    if (!isEnable) {
      return false;
    }

    //cek jika sudah mengiszinkan perizinan
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // jika perizinan ditolak kemudian meminta perizinan kembali
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  //mendapat lokasi sekarang user
  getUserLocation() async {
    var isEnable = await checkPermission();
    if (isEnable) {
      Position location = await Geolocator.getCurrentPosition();
      setState(() {
        result = "";
        lat = location.latitude.toString();
        lng = location.longitude.toString();
      });
    } else {
      setState(() {
        result = "Permissoin is not allow";
      });
    }
  }

  Widget displayLocation() {
    return Column(
      children: [
        Text(
          result,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          lat,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        Text(
          lng,
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  gotoMap() {
    try {
      var url = "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
      final Uri _url = Uri.parse(url);
      launchUrl(_url);
    } catch (_) {
      print("Error launch Map");
    }
  }
}
