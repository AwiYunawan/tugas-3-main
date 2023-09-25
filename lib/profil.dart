import 'package:flutter/material.dart';
import 'package:profil/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  var profil;

  @override
  void initState() {
    super.initState();
    _loadProfil();
  }

  _loadProfil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    profil = prefs.getStringList('mhs');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: Center(
        child: _buildProfilCard(),
      ),
      drawer: const SideMenu(),
    );
  }

  Widget _buildProfilCard() {
    if (profil == null || profil.isEmpty) {
      return const CircularProgressIndicator();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage(
                'assets/images/profile_image.png'), // Ganti dengan path ke gambar profil
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: const Text('NIM'),
                    subtitle: Text(
                      profil[0],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: const Text('Nama'),
                    subtitle: Text(
                      profil[1],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: const Text('No HP'),
                    subtitle: Text(
                      profil[2],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: const Text('E-mail'),
                    subtitle: Text(
                      profil[3],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: const Text('Fakultas'),
                    subtitle: Text(
                      profil[4],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: const Text('Jurusan'),
                    subtitle: Text(
                      profil[5],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
