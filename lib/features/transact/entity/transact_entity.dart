class TransactEntity {
  const TransactEntity({
    required this.createAt,
    required this.updateAt,
    required this.userId,
    required this.details,
  });
  final DateTime createAt;
  final DateTime updateAt;
  final String userId;
  final String details;

  @override
  String toString() =>
      'TransactEntity(createAt:$createAt, updateAt:$updateAt, userId:$userId,details:$details)';
}
