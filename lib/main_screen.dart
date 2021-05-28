import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anotacoes/controller.dart/nota_controller.dart';
import 'package:flutter_anotacoes/widgets/my_drawer.dart';
import 'package:flutter_anotacoes/widgets/nota_item.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NotaController controller = NotaController();
  int _count = 2;
  double _ratio = 2.0;

  @override
  void initState() {
    atualizarTela();
    super.initState();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black54,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Builder(
                      builder: (context) => IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: controller.procurarController,
                      decoration: InputDecoration(
                        hintText: 'Pesquise suas notas',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await controller.buscarPorTitulo();
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: _ratio,
                crossAxisCount: _count,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: List.generate(
                    controller.listaNotas.length,
                    (index) => NotaWidget(
                          nota: controller.listaNotas[index],
                          atualizaTela: () {
                            setState(() {});
                          },
                        )),
              ),
            )
          ],
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 8, right: 8),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.model_training_outlined,
                size: 40,
              ),
              onPressed: () async {
                await controller.buscarTodos();
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.dashboard,
                size: 40,
              ),
              onPressed: () {
                setState(() {
                  if (_count == 1) {
                    _count = 2;
                    _ratio = 2.0;
                  } else {
                    _count = 1;
                    _ratio = 3.0;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void atualizarTela() async {
    await controller.buscarTodos();
    setState(() {});
  }
}
