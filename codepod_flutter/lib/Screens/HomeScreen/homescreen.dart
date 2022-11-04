import 'package:codepod_flutter/Screens/HomeScreen/components/homescreen_body.dart';
import 'package:codepod_flutter/Screens/LoginScreen/loginscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codepod'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              })
        ],
      ),
      body: const HomeScreenBody(),
    );
  }
}
