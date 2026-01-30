
import '../domain/gateways/pockets_gateway.dart';
import '../domain/usecases/pockets_usecases.dart';

class PocketsConfig {
  final PocketsGateway _pocketsApi;
  late PocketsUseCase usecases;

  PocketsConfig(this._pocketsApi) {
    usecases = PocketsUseCase(_pocketsApi);
  }
}
