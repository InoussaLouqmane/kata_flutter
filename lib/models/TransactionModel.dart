import 'PaymentsModel.dart';
import 'UserModel.dart';

class TransactionModel {
  final int id;
  final int payerId;
  final int paymentId;
  final String transactionStatus;
  final String? reference;
  final String? bill;
  final double cost;


  TransactionModel({
    required this.id,
    required this.payerId,
    required this.paymentId,
    required this.transactionStatus,
    this.reference,
    this.bill,
    required this.cost,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as int,
      payerId: json['payer_id'] as int,
      paymentId: json['payment_id'] as int,
      transactionStatus: json['transaction_status'] as String,
      reference: json['reference'] as String?,
      bill: json['bill'] as String?,
      cost: double.parse(json['cost'].toString()),

    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'payer_id': payerId,
    'payment_id': paymentId,
    'transaction_status': transactionStatus,
    'reference': reference,
    'bill': bill,
    'cost': cost,
  };
}