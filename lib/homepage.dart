import 'package:flutter/material.dart';
import 'package:task_hava_havaii/api.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  var data;

  @override
  void initState() {
    // TODO: implement initState
    data = getApi(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
        actions: [Icon(Icons.shopping_cart)],
      ),
      body: Text(data),
    );
  }
}