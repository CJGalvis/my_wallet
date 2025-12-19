import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:my_wallet_home/my_wallet_home.dart';

class PocketsApiMock extends PocketsGateway {
  @override
  Future<(ErrorItem?, Pocket?)> createPocket(Pocket pocket) async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value((null, null));
  }

  @override
  Future<(ErrorItem?, List<Pocket>?)> getPockets() {
    throw UnimplementedError();
  }
}
