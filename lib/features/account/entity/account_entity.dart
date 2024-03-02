import '../../../../core/utils/status.dart';

abstract interface class AccountEntity<T> {
  Status withdrawal(String userUuid, double incomeAmount);
  Status consigment(String userUuid, double amount);
  double _amount = 0.0;
  double get getAmount => _amount;

  set setAmount(double value) => _amount = value;
}
