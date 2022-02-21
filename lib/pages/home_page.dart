import 'package:flutter/material.dart';
import 'package:reverse_dependence/core/local_storage/local_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.localStorage}) : super(key: key);
  final ILocalStorage localStorage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localStorage.getString(key: 'title'),
        ),
      ),
    );
  }
}
