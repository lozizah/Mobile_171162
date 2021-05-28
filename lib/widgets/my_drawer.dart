import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/add_nota.dart';
import 'package:flutter_anotacoes/controller.dart/LoginRegistroController.dart';

class MyDrawer extends StatelessWidget {
  final LoginRegistroController controller = LoginRegistroController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.edit,
            ),
            title: Text(
              'Anotações',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddNotas())),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'Sobre',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => controller.logout(context),
          ),
        ],
      ),
    );
  }
}
