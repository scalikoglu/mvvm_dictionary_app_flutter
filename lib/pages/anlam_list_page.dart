import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnlamListPage extends StatefulWidget {
  const AnlamListPage({super.key});

  @override
  State<AnlamListPage> createState() => _AnlamListPageState();
}

class _AnlamListPageState extends State<AnlamListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelime Anlam'),
      ),
    );
  }
}
