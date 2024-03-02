import '../account/entity/account_entity.dart';
import 'entity/customer_entity.dart';

class Customer<T extends AccountEntity> implements CustomerEntity {
  const Customer({
    required this.id,
    required this.account,
  });

  final String id;
  final T account;
}
