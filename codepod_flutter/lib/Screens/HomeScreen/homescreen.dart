import 'package:codepod_flutter/Screens/HomeScreen/components/homescreen_body.dart';
import 'package:codepod_flutter/Screens/LoginScreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('284e82'),
        title: const Text('Codepod'),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                // CreditCard cardDetails = CreditCard(
                //     cardNumber: '4012 2106 8501 1000',
                //     cardHolderName: 'Saif',
                //     expiryDate: '05/25',
                //     cvvCode: '555');
                // var result = await client.creditCard.insertData(cardDetails);

                // Refreshes the page

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              }),
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
