import 'package:codepod_server/src/generated/credit_card_class.dart';
import 'package:serverpod/serverpod.dart';

class CreditCardEndpoint extends Endpoint {
  Future<List<CreditCard>> fetchAllCreds(Session session) async {
    List<CreditCard> query = await CreditCard.find(session);
    return query;
  }

  Future<bool> insertData(Session session, CreditCard cardDetails) async {
    CreditCard.insert(session, cardDetails);
    return true;
  }
}
