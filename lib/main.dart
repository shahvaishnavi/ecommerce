import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: ecom(),
  ));
}

class ecom extends StatefulWidget {
  const ecom({Key? key}) : super(key: key);

  @override
  State<ecom> createState() => _ecomState();
}

class _ecomState extends State<ecom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PRODUCT PAGE")),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return addproduct();
                  },
                ));
              },
              title: Text("ADD PRODUCT"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return viewproduct();
                  },
                ));
              },
              title: Text("VIEW PRODUCT"),
            )
          ],
        ),
      ),
    );
  }
}

class addproduct extends StatefulWidget {
  const addproduct({Key? key}) : super(key: key);

  @override
  State<addproduct> createState() => _addproductState();
}

class _addproductState extends State<addproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  showDialog(
                      builder: (context) {
                        return Dialog(
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final XFile? photo = await _picker
                                        .pickImage(source: ImageSource.camera);
                                    setState(() {
                                      img = photo!.path;
                                    });
                                  },
                                  icon: Icon(Icons.camera),
                                  label: Text("camera")),
                              ElevatedButton.icon(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      img = image!.path;
                                    });
                                  },
                                  icon: Icon(Icons.photo),
                                  label: Text("Gallery")),
                            ],
                          ),
                        );
                      },
                      context: context);
                },
                child: img != ""
                    ? Container(
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(File(img)),
                        ),
                      )
                    : Container(
                        child: CircleAvatar(
                        radius: 90,
                      ))),
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Center(
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "ENTER UR NAME", hintText: "NAME"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
              child: Center(
                child: TextField(
                  controller: price,
                  decoration:
                      InputDecoration(labelText: "SET PRICE", hintText: "RATE"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String img = "";
}

class viewproduct extends StatefulWidget {
  const viewproduct({Key? key}) : super(key: key);

  @override
  State<viewproduct> createState() => _viewproductState();
}

class _viewproductState extends State<viewproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigoAccent,
      ),
    );
  }
}
