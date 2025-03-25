import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ref;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_hava_havaii/api.dart';
import 'package:task_hava_havaii/data_model.dart';

Widget ShoppingCart(){

  final data =getApi();
return Scaffold(
  body: SafeArea(child: Consumer(
    builder: (context, ref, child) =>
    FutureBuilder(
      future: data,
      builder:(context,snapshot) {
      
      if(snapshot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator();
      }
      else if(snapshot.hasData){
        final list = snapshot.data!["products"];
       return ListView.builder(
        itemCount: ref.watch(mapProvider).length,
        itemBuilder: (context,index) { 
      
          final productList = ref.watch(mapProvider).entries;
          final productEntry = productList.elementAt(index);
          final productId = productEntry.key;
            final product = list[productId-1];
        return ListTile(
          title: Text(product["title"]),);
      }
      );
      }
      else{
        return Text("error ocurred");
      }
      
      
      }
    ),),),
);
}