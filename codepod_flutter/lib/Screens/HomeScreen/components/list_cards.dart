import 'package:codepod_flutter/API/db.dart';
import 'package:codepod_client/codepod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class ListCards extends StatefulWidget {
  const ListCards({super.key});

  @override
  State<ListCards> createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: Database.fetchAllCreds(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<CreditCard> result = snapshot.data;

            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return CreditCardWidget(
                  cardNumber: result[index].cardNumber,
                  expiryDate: result[index].cvvCode,
                  cardHolderName: result[index].cardHolderName,
                  cvvCode: result[index].cvvCode,
                  showBackView: false,
                  obscureCardNumber: false,
                  obscureCardCvv: false,
                  isHolderNameVisible: true,
                  onCreditCardWidgetChange: (creditCardBrand) {},
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
