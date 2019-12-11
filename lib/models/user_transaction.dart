import 'package:intl/intl.dart';

class Transaction {

final String accountId;
  final double amount;
  final DateTime transactionDate;
  final String transactionId;
  final String transactionType;

  String get createdAtFormatted =>
      DateFormat.yMMMd().add_Hm().format(transactionDate);

  Transaction.fromJson(Map<String, dynamic> json)
      : accountId = json['accountId'],
        amount = json['amount'],
        transactionDate = DateTime.parse(json['transactionType']),
        transactionId = json['transactionId'],
        transactionType = json['transactionType'];
}
