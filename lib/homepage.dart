import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:task_hava_havaii/api.dart';
import 'package:task_hava_havaii/product_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

   

  @override
  void initState() {
    // TODO: implement initState
    // data = getApi(context);
    // getApi();
    
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    final data = getApi();

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text("Catalogue"),
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),
      body :
        Center(child:
        FutureBuilder(
          future: data,
         builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            return Container(
              child: 
              productData(snapshot.data),
            );
          }
          else {
            return Text("Aerror");
          }
        })
        )
        

        );
        
        }
}