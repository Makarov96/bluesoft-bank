import 'package:BluesoftBank/core/utils/status.dart';

import '../transact/entity/transact_entity.dart';
import '../transact/report/transact_report.dart';
import 'entity/account_entity.dart';

abstract mixin class SavingsImprovement {
  double checkAccountBalance(String uuid);
  Future<List<TransactEntity>> checkRecentsTrasacts(String uuid);
  Future<List<TransactEntity>> mounthlySummary(String uuid);
}

class SavingsAccount with SavingsImprovement implements AccountEntity {
  SavingsAccount({
    required this.initialAmount,
    required this.transact,
  });

  final TransactReport transact;
  double initialAmount;

  @override
  Status consigment(String userUuid, double incomeAmount) {
    if (getAmount <= 0) {
      return Status.failure;
    }
    try {
      setAmount = (getAmount + incomeAmount);

      transact.saveInform(
        transact: TransactEntity(
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
          userId: userUuid,
          details:
              'User with id:$userUuid made a consigment with amount: $incomeAmount in an account type: Savings',
        ),
      );
      return Status.success;
    } catch (e) {
      print(e);
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
              'User with id:$userUuid made a withdrawal with amount: $incomeAmount in an account type: Savings',
        ),
      );
      return Status.success;
    } catch (e) {
      return Status.failure;
    }
  }

  @override
  double checkAccountBalance(String userUuid) {
    transact.saveInform(
      transact: TransactEntity(
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
        userId: userUuid,
        details:
            'User with id:$userUuid made a checkAccountBalance  in an account type: Savings',
      ),
    );
    return getAmount;
  }

  @override
  Future<List<TransactEntity>> checkRecentsTrasacts(String uuid) =>
      transact.getRecentTransact(userId: uuid);

  @override
  Future<List<TransactEntity>> mounthlySummary(String uuid) =>
      transact.getMonthlyReport(userId: uuid);

  @override
  double get getAmount => initialAmount;

  @override
  set setAmount(double value) {
    initialAmount = getAmount + value;
  }
}
