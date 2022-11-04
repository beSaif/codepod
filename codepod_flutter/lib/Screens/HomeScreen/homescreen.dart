import 'package:codepod_flutter/Screens/HomeScreen/components/homescreen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codepod'),
      ),
      body: const HomeScreenBody(),
    );
  }
}
