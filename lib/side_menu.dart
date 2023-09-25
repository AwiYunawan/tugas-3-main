import 'package:flutter/material.dart';
import 'package:profil/form_data.dart';
import 'package:profil/profil.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      const DrawerHeader(
        child: Text('Menu Aplikasi'),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Form'),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FormData(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Profil Saya'),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Profil(),
            ),
          );
        },
      ),
    ]));
  }
}
