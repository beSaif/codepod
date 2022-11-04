import 'package:codepod_flutter/API/db.dart';
import 'package:codepod_flutter/Screens/HomeScreen/components/add_cards.dart';
import 'package:codepod_flutter/Screens/HomeScreen/components/list_cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    Database.fetchAllCreds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "MY CARDS",
            style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListCards(),
          const AddCardPopUp(),
        ],
      ),
    );
  }
}
