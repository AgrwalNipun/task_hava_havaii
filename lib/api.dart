import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String,dynamic>> getApi(BuildContext context) async{
try{

   final res = http.get(Uri.parse("https://dummyjson.com/products"));
  final data = jsonDecode(res.toString());
return data;
}catch(e){
  Navigator.push(context, MaterialPageRoute(builder:(context)=> SnackBar(content: Text(e.toString()))));
  rethrow;
}
     
}