import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:jsr/air_infus.dart';
import 'package:jsr/ramuan_herbal.dart';
import 'package:jsr/pengantar.dart';
import 'package:jsr/tentang.dart';

/// Flutter code sample for [Drawer].

void main() => runApp(const DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const DrawerExample(),
    );
  }
}

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  String selectedPage = '';
  var _data;

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/dataRH.json');
    final data = await json.decode(response);
    setState(() {
      _data = data;
      //print(_data["resep"]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image(
                  image: AssetImage('assets/images/foto.jpg'),
                  fit: BoxFit.cover),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Pengantar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pengantar()));
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.compost),
              title: const Text('Ramuan Herbal'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RamuanHerbal(
                              data: _data["resep"],
                            )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_drink),
              title: const Text('Infused Water'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AirInfus(
                              data: _data["resep"],
                            )));
              },
            ),
            ListTile(
              leading: const Icon(Icons.sticky_note_2),
              title: const Text('Doa Rukyah'),
              onTap: () {
                setState(() {
                  selectedPage = 'Settings';
                });
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tentang()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Page: $selectedPage'),
      ),
    );
  }
}
