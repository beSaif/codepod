/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'dart:typed_data';
import 'protocol.dart';

class CreditCard extends TableRow {
  @override
  String get className => 'CreditCard';
  @override
  String get tableName => 'creditcard';

  static final t = CreditCardTable();

  @override
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

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'cvvCode': cvvCode,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'cardNumber':
        cardNumber = value;
        return;
      case 'cardHolderName':
        cardHolderName = value;
        return;
      case 'expiryDate':
        expiryDate = value;
        return;
      case 'cvvCode':
        cvvCode = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<CreditCard>> find(
    Session session, {
    CreditCardExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<CreditCard>(
      where: where != null ? where(CreditCard.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CreditCard?> findSingleRow(
    Session session, {
    CreditCardExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<CreditCard>(
      where: where != null ? where(CreditCard.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CreditCard?> findById(Session session, int id) async {
    return session.db.findById<CreditCard>(id);
  }

  static Future<int> delete(
    Session session, {
    required CreditCardExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<CreditCard>(
      where: where(CreditCard.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    CreditCard row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    CreditCard row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    CreditCard row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    CreditCardExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<CreditCard>(
      where: where != null ? where(CreditCard.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CreditCardExpressionBuilder = Expression Function(CreditCardTable t);

class CreditCardTable extends Table {
  CreditCardTable() : super(tableName: 'creditcard');

  @override
  String tableName = 'creditcard';
  final id = ColumnInt('id');
  final cardNumber = ColumnString('cardNumber');
  final cardHolderName = ColumnString('cardHolderName');
  final expiryDate = ColumnString('expiryDate');
  final cvvCode = ColumnString('cvvCode');

  @override
  List<Column> get columns => [
        id,
        cardNumber,
        cardHolderName,
        expiryDate,
        cvvCode,
      ];
}

@Deprecated('Use CreditCardTable.t instead.')
CreditCardTable tCreditCard = CreditCardTable();
