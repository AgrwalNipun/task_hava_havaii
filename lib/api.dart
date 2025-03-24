import 'dart:convert';

import 'package:http/http.dart' as http;

  Future<dynamic> getApi() async{


    final res = await http.get(Uri.parse("https://dummyjson.com/products"));
    final data = jsonDecode(res.body);
    return data;
  
     
}