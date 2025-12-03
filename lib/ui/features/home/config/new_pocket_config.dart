import '../domain/gateways/pockets_gateway.dart';
import '../domain/usecases/pockets_usecases.dart';

class NewPocketConfig {
  final PocketsGateway _pocketsApi;
  late PocketsUseCase usecases;

  NewPocketConfig(this._pocketsApi) {
    usecases = PocketsUseCase(_pocketsApi);
  }
}
