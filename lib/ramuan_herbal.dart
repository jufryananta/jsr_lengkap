import 'package:flutter/material.dart';
import 'package:jsr/resep_detail.dart';

class RamuanHerbal extends StatelessWidget {
  final data;
  const RamuanHerbal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IsiHalaman(data: data);
    //return MaterialApp(
    //  theme: ThemeData(useMaterial3: true),
    //  home: IsiHalaman(data: data,),
    //);
  }
}

class IsiHalaman extends StatefulWidget {
  final data;
  const IsiHalaman({super.key, this.data});

  @override
  State<IsiHalaman> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<IsiHalaman> {
  var _dataCari;
  bool _cari = false;
  final fieldText = TextEditingController();
  late FocusNode focusNode;

  _DrawerExampleState();

  @override
  void initState() {
    _dataCari = widget.data;
    focusNode = FocusNode();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results;
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.data;
    } else {
      results = [];
      for (final detail in widget.data) {
        if (detail["nama"]
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase())) {
          results.add(detail);
          //return;
        }
      }
    }

    // Refresh the UI
    setState(() {
      _dataCari = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ramuan Herbal"),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                focusNode.requestFocus();
                setState(() {
                  _cari = !_cari;
                });
              })
        ],
      ),
      body: Center(
          child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: _cari,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              focusNode: focusNode,
              controller: fieldText,
              style: const TextStyle(fontSize: 18),
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    child: const Icon(Icons.clear),
                    onTap: () {
                      fieldText.clear();
                      setState(() {
                        _dataCari = widget.data;
                      });
                    },
                  ),
                  labelText: 'Cari'),
            ),
          ),
        ),
        SizedBox(
          height: _cari ? 30 : 0,
        ),
        Expanded(
          child: _dataCari.isNotEmpty
              ? ListView.builder(
                  itemCount: _dataCari.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: ValueKey(_dataCari[index]["id"]),
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      color: Colors.amber.shade100,
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResepDetail(
                                        data: _dataCari[index],
                                      )));
                        },
                        child: ListTile(
                          leading: Text(
                            _dataCari[index]["id"].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          title: Text(
                            _dataCari[index]["nama"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                            _dataCari[index]["info"],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Text(
                  'Tidak ada yang cocok',
                  style: TextStyle(fontSize: 24),
                ),
        )
      ])),
    );
  }
}
