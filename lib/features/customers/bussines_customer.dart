import '../account/entity/account_entity.dart';
import 'entity/customer_entity.dart';

class BussinesCustomer<T extends AccountEntity> implements CustomerEntity {
  const BussinesCustomer({
    required this.bussinesId,
    required this.bussinesAccount,
  });

  final String bussinesId;
  final T bussinesAccount;
}
