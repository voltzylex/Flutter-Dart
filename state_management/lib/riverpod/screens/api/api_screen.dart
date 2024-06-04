import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});
  static get route => MaterialPageRoute(
        builder: (context) => const ApiScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final futureData = watch.watch(fetchData);
            return futureData.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Define a provider for fetching data
final fetchData = FutureProvider<List<String>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return List<String>.from(data);
  } else {
    throw Exception('Failed to load data');
  }
});
