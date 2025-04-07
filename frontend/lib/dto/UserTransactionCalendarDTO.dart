class UserTransactionCalendarDTO {
  final DateTime? date;
  final double? upAmount;
  final double? downAmount;

  UserTransactionCalendarDTO({
    this.date,
    this.upAmount,
    this.downAmount
  });

  factory UserTransactionCalendarDTO.fromJson(Map<String, dynamic> json) {
    return UserTransactionCalendarDTO(
      date: json['date'] != null
          ? DateTime.tryParse(json['date'])
          : null,
      upAmount: json['upAmount'] != null ? (json['upAmount'] as num).toDouble() : null,
      downAmount: json['downAmount'] != null ? (json['downAmount'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date?.toIso8601String(),
    'upAmount': upAmount,
    'downAmount': downAmount
  };
}