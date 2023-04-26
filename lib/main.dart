import 'package:flutter/material.dart';
import 'package:flutter_instargram/src/app.dart';
import 'package:flutter_instargram/src/binding/init_bindings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
          )
        ),
        // 앱이 실행되는 순간 인스턴스로 올라감
        initialBinding: InitBinding(),
        home: const App(),
    );
  } 
}