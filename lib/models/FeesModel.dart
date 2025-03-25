import 'PaymentsModel.dart';

class FeesModel {
  final int feeId;
  final String feeName;
  final double? amount;
  final List<PaymentModel> payments;

  FeesModel({
    required this.feeId,
    required this.feeName,
    this.amount,
    required this.payments,
  });

  factory FeesModel.fromJson(Map<String, dynamic> json) {
    return FeesModel(
      feeId: json['fee_id'] as int,
      feeName: json['fee_name'] as String,
      amount: json['amount']?.toDouble() as double?,
      payments: (json['payments'] as List<PaymentModel>)
          .map((paymentJson) => PaymentModel.fromJson(paymentJson as Map<String, dynamic>))
          .toList(),
    );
  }
}
