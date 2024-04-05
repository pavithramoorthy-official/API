import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NormalApi extends StatefulWidget {
  const NormalApi({super.key});

  @override
  State<NormalApi> createState() => _NormalApiState();
}

class _NormalApiState extends State<NormalApi> {
  List _product = [];

  getProduct() async {
    String url1 = 'https://fakestoreapi.com/products';
    var response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      setState(() {
        _product = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normal Api'),
      ),
      body: Container(
        //color: Colors.amberAccent,
        child: ListView.builder(
          itemCount: _product.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Colors.purpleAccent,
                ),
                child: ListTile(
                  title: Text(_product[index]['title']),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
