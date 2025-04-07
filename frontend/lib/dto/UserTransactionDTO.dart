class UserTransactionDTO {
  final int? id;
  final int? userInfoId;
  final double? amount;
  final String? transactionCategory;
  final String? name;
  final DateTime? localDateTime;

  UserTransactionDTO({
    this.id,
    this.userInfoId,
    this.amount,
    this.transactionCategory,
    this.name,
    this.localDateTime,
  });

  factory UserTransactionDTO.fromJson(Map<String, dynamic> json) {
    return UserTransactionDTO(
      id: json['id'] as int?,
      userInfoId: json['userInfoId'] as int?,
      amount: json['amount'] != null ? (json['amount'] as num).toDouble() : null,
      transactionCategory: json['transactionCategory'] as String?,
      name: json['name'] as String?,
      localDateTime: json['localDateTime'] != null
          ? DateTime.tryParse(json['localDateTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userInfoId': userInfoId,
    'amount': amount,
    'transactionCategory': transactionCategory,
    'name': name,
    'localDateTime': localDateTime?.toIso8601String(),
  };
}
