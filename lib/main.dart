import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _count = 2;
  double _ratio = 2.0;

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
                    child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer()),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquise suas notas',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddNotas())),
                    ),
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
                children: [
                  notaWidget(color: Colors.lightBlue[100]),
                  notaWidget(color: Colors.limeAccent[100]),
                  notaWidget(color: Colors.lightGreen[100]),
                  notaWidget(color: Colors.purple[100]),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
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
              leading: Icon(
                Icons.arrow_right_sharp,
              ),
              title: Text(
                'Arquivadas',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(
                'Sobre',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
              onPressed: () {
                setState(() {
                  //_lightTheme = false;
                });
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
}

Widget notaWidget(
    {String title = 'Título',
    String descricao = 'Descrição',
    Color color = Colors.lightBlue}) {
  return ListTile(
    title: Text(title),
    subtitle: Text(descricao),
    tileColor: color,
  );
}

class AddNotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Título'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Texto'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 8, right: 8),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 40,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.photo_size_select_actual_rounded,
                  size: 40,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.check,
                  size: 40,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
