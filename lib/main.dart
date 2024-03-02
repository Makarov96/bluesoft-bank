import 'features/account/ordinary_account.dart';
import 'features/account/savings_account.dart';
import 'features/customers/bussines_customer.dart';
import 'features/customers/customer.dart';
import 'features/transact/report/transact_report.dart';

Future<void> main() async {
  final _customerId = 'f7a9245c-2537-4b1c-b1e6-3fcdb9d28e4a';
  final _customerId2 = 'f7a9245c-2537-4b1c-b1e6-5j63h4h34h5k';
  final _bussinesId = '6a81f334-0a6c-4d94-bb35-12a18df69e7b';

  final transact = Transact();
  final bussinesCustomer = BussinesCustomer(
    bussinesId: _bussinesId,
    bussinesAccount:
        OrdinaryAccount(initialAmount: 3000000, transact: transact),
  );

  final customer = Customer(
      id: _customerId,
      account: SavingsAccount(
        initialAmount: 10000000,
        transact: transact,
      ));

  final customer2 = Customer(
      id: _customerId2,
      account: SavingsAccount(
        initialAmount: 100000,
        transact: transact,
      ));

  print(
      'CUSTOMER 2 TRANSACTION: ${customer2.account.withdrawal(_customerId2, 400)}');

  print(
      'CUSTOMER 1 TRANSACTION:${customer.account.consigment(_customerId, 5)}');
  print(
      'BUSSINES 1 TRANSACTION ${bussinesCustomer.bussinesAccount.consigment(_bussinesId, 10)}');

  print(customer.account.getAmount);
  print(bussinesCustomer.bussinesAccount.getAmount);

  print(
      'CUSTOMER 1 TRANSACTION ${customer.account.withdrawal(_customerId, 5000)}');
  print(bussinesCustomer.bussinesAccount.withdrawal(_bussinesId, 10));

  print(customer.account.getAmount);
  print(bussinesCustomer.bussinesAccount.getAmount);

  print(
      'CUSTOMER 1 TRANSACTION user_id:${_customerId} account balance: ${customer.account.checkAccountBalance(_customerId)}');

  final transaction = await customer.account.checkRecentsTrasacts(_customerId);
  print('-------------------------------------');
  print('-----------TRANSACTIONS--------------');
  print('-------------------------------------');
  transaction.forEach(
    (value) {
      print('user_id:${_customerId} transactions: ${value.toString()}');
    },
  );

  print('-------------------------------------');
  print('--------END-TRANSACTIONS-------------');
  print('-------------------------------------');
  print('\n');
  final monthlySummary = await customer.account.mounthlySummary(_customerId);

  print('-------------------------------------');
  print('-----------Monthly Report------------');
  print('-------------------------------------');
  monthlySummary.forEach(
    (value) {
      print('user_id:${_customerId} transactions: ${value.toString()}');
    },
  );
  print('-------------------------------------');
  print('--------END-Monthly Report-----------');
  print('-------------------------------------');
  print('\n');

  final sortReport = await transact.getAllSortByCountTransact();

  print('-------------------------------------------------------');
  print('-----Sort Report By Count Order Transaction------------');
  print('-------------------------------------------------------');
  sortReport.forEach(
    (value) {
      print(
          'userId:${value.userId} details:${value.details}  date:${value.createAt}');
    },
  );
  print('-------------------------------------------------------');
  print('-----End Sort Report By Count Order Transaction--------');
  print('-------------------------------------------------------');
  print('\n');
}
