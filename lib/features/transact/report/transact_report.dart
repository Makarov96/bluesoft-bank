import 'dart:developer';

import '../../../../core/utils/status.dart';
import '../entity/transact_entity.dart';

abstract interface class TransactReport {
  const TransactReport();
  Future<Status> saveInform({required TransactEntity transact});
  Future<List<TransactEntity>> getRecentTransact({required String userId});
  Future<List<TransactEntity>> getMonthlyReport({required String userId});
  Future<List<TransactEntity>> getAllSortByCountTransact();
}

List<TransactEntity> _mockInfo = [];

class Transact extends TransactReport {
  const Transact();
  @override
  Future<List<TransactEntity>> getRecentTransact(
      {required String userId}) async {
    try {
      await Future.delayed(Duration(microseconds: 400));
      final userList =
          _mockInfo.where((element) => element.userId == userId).toList();
      final last3Transaction = userList.take(3).toList();
      return last3Transaction;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<Status> saveInform({required TransactEntity transact}) async {
    try {
      await Future.delayed(Duration(microseconds: 400));
      _mockInfo.add(transact);
      return Status.success;
    } catch (e) {
      return Status.failure;
    }
  }

  @override
  Future<List<TransactEntity>> getMonthlyReport(
      {required String userId}) async {
    try {
      await Future.delayed(Duration(microseconds: 400));
      final currentMonthlyReports = _mockInfo
          .where((element) =>
              element.createAt.month == DateTime.now().month &&
              element.userId == userId)
          .toList();
      return currentMonthlyReports;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<TransactEntity>> getAllSortByCountTransact() async {
    try {
      final sortList = sortByConcurrency(_mockInfo);
      // Print the sorted transactions
      return sortList;
    } catch (e) {
      return [];
    }
  }

  List<TransactEntity> sortByConcurrency(List<TransactEntity> transactions) {
    final counts = countConcurrentElements(transactions);

    transactions.sort((a, b) => counts[b.userId]!.compareTo(counts[a.userId]!));

    return transactions;
  }

  Map<String, int> countConcurrentElements(List<TransactEntity> transactions) {
    final counts = <String, int>{};

    for (final transaction in transactions) {
      counts[transaction.userId] = (counts[transaction.userId] ?? 0) + 1;
    }

    return counts;
  }
}
