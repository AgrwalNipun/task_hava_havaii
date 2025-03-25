import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_hava_havaii/homepage.dart';

void main() {
  runApp(Builder(
    builder: (context) {
      return ProviderScope(child: const MyApp());
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Homepage(),
    );
  }
}
