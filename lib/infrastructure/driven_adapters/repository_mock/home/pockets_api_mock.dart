import 'package:my_wallet/domain/models/error_item.dart';
import 'package:my_wallet/ui/features/home/domain/gateways/pockets_gateway.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';

class PocketsApiMock extends PocketsGateway {
  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
   await Future.delayed(Duration(seconds: 1));
   return Future.value((null, null));
  }
  
  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets(String owner) {
    throw UnimplementedError();
  }
}