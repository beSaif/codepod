/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class CreditCard extends SerializableEntity {
  @override
  String get className => 'CreditCard';

  int? id;
  late String cardNumber;
  late String cardHolderName;
  late String expiryDate;
  late String cvvCode;

  CreditCard({
    this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvvCode,
  });

  CreditCard.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    cardNumber = _data['cardNumber']!;
    cardHolderName = _data['cardHolderName']!;
    expiryDate = _data['expiryDate']!;
    cvvCode = _data['cvvCode']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
    });
  }
}
