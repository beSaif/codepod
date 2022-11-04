import 'package:codepod_client/codepod_client.dart';
import 'package:codepod_flutter/Screens/HomeScreen/homescreen.dart';
import 'package:codepod_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCardPopUp extends StatefulWidget {
  const AddCardPopUp({super.key});

  @override
  State<AddCardPopUp> createState() => _AddCardPopUpState();
}

class _AddCardPopUpState extends State<AddCardPopUp> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (builder) {
            return childWidget();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }

  childWidget() {
    return Container(
      height: double.infinity,
      color: HexColor('284e82'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      CreditCard newcard = CreditCard(
                          cardNumber: cardNumber,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          cvvCode: cvvCode);

                      var addCard = await client.creditCard.insertData(newcard);

                      debugPrint('Added Card to Db: $addCard');
                      // Resetting the form and formkey state

                      formKey.currentState!.reset();
                      cardNumber = '';
                      expiryDate = '';
                      cardHolderName = '';
                      cvvCode = '';

                      Navigator.pop(context);
                      // Refreshes the page

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      debugPrint('invalid!');
                    }
                  },
                  child: const Text('Add Card'),
                ),
              ],
            ),
            Expanded(
              child: CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration:
                    inputBorder('Number', 'XXXX XXXX XXXX XXXX'),
                expiryDateDecoration: inputBorder('Expired Date', 'XX/XX'),
                cvvCodeDecoration: inputBorder('CVV', 'XXX'),
                cardHolderDecoration: inputBorder('Card Holder', ''),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
  }

  inputBorder(String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
      focusedBorder: border,
      enabledBorder: border,
    );
  }
}
