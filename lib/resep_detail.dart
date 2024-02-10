import 'package:flutter/material.dart';
import 'package:jsr/string_ext.dart';

class ResepDetail extends StatelessWidget {
  final data;
  const ResepDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['nama'],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        //child: Column(
        //  mainAxisSize: MainAxisSize.max,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Image(
                        image:
                            AssetImage('assets/images/' + data["img"] + '.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1,
                          child: Text(
                            'sumber: ' + data['sumber'],
                            style: TextStyle(
                                backgroundColor:
                                    Color.fromARGB(172, 58, 58, 58),
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ]),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    flex: 7,
                    child: Column(children: [
                      Container(
                          color: Color.fromARGB(255, 162, 212, 253),
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: Text(
                            'Bahan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      ListView.builder(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shrinkWrap: true,
                        itemCount: data['bahan'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            visualDensity: VisualDensity(vertical: -3),
                            title: Text(data["bahan"][index]),
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                actionsAlignment: MainAxisAlignment.center,
                                surfaceTintColor: Colors.white,
                                title: Text(data['tag'][index]
                                    .toString()
                                    .replaceAll('_', ' ')
                                    .capitalizeEach()),
                                content: SizedBox(
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/bahan/' +
                                                data['tag'][index] +
                                                '.jpg'))),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                          color: Color.fromARGB(255, 251, 255, 201),
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Cara Membuat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      ListView.builder(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shrinkWrap: true,
                        itemCount: data['cara'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.all(4),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text((index + 1).toString() + '. '),
                                    Flexible(child: Text(data['cara'][index])),
                                  ]));
                        },
                      ),
                      Container(
                          color: Color.fromARGB(255, 201, 255, 234),
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            'Manfaat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      ListView.builder(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shrinkWrap: true,
                        itemCount: data['manfaat'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.all(4),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('\u2022 '),
                                    Flexible(
                                        child: Text(data['manfaat'][index])),
                                  ]));
                        },
                      ),
                    ])),
              ])
        ],
      ),
    );
  }
}
