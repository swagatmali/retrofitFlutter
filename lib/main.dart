import 'package:dio/dio.dart';
import 'package:first_flutter/pages/api_service.dart';
import 'package:first_flutter/pages/post_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Future<List<PostModel>> fetchPost() async {
  final apiService =
      ApiService(Dio(BaseOptions(contentType: "Application/json")));
  try {
    final response = await apiService.getPosts();
    return response;
  } catch (err) {
    throw Exception("error");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Flutter Demo Home Page')),
          body: Center(
              child: ElevatedButton(
            onPressed: () {
              fetchPost().then((value) {
                print('Button pressed!' + value.length.toString());
              });
              // This function will be executed when the button is pressed
            },
            child: Text('Click Me'),
          ))),
    );
  }
}
