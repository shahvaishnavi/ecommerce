import 'package:flutter/material.dart';

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
      backgroundColor: Colors.indigoAccent,
    );
  }
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
