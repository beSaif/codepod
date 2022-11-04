import 'package:codepod_flutter/main.dart';

class Database {
  static Future fetchAllCreds() async {
    var result = await client.creditCard.fetchAllCreds();

    return result;
  }
}
