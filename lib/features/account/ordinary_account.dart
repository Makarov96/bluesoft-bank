import 'package:BluesoftBank/core/utils/status.dart';

import '../transact/entity/transact_entity.dart';
import '../transact/report/transact_report.dart';
import 'entity/account_entity.dart';

class OrdinaryAccount implements AccountEntity {
  OrdinaryAccount({
    required this.initialAmount,
    required this.transact,
  });
  double initialAmount;
  final TransactReport transact;

  @override
  Status consigment(String userUuid, double incomeAmount) {
    if (getAmount <= 0) {
      return Status.failure;
    }
    try {
      setAmount = getAmount + incomeAmount;
      transact.saveInform(
        transact: TransactEntity(
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
          userId: userUuid,
          details:
              'User with id:$userUuid made a consigment with amount: $incomeAmount in an account type: Ordinary',
        ),
      );
      return Status.success;
    } catch (e) {
      return Status.failure;
    }
  }

  @override
  Status withdrawal(String userUuid, double incomeAmount) {
    if (getAmount <= 0) {
      return Status.failure;
    }
    try {
      setAmount = getAmount - incomeAmount;
      transact.saveInform(
        transact: TransactEntity(
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
          userId: userUuid,
          details:
              'User with id:$userUuid made a withdrawal with amount: $incomeAmount in an account type: Ordinary',
        ),
      );
      return Status.success;
    } catch (e) {
      return Status.failure;
    }
  }

  @override
  double get getAmount => initialAmount;

  @override
  set setAmount(double value) {
    initialAmount = getAmount + value;
  }
}
