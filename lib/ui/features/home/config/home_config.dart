import '../domain/gateways/pockets_gateway.dart';
import '../domain/usecases/pockets_usecases.dart';

class HomeConfig {
  final PocketsGateway _pocketsApi;
  late PocketsUseCase usecases;

  HomeConfig(this._pocketsApi) {
    usecases = PocketsUseCase(_pocketsApi);
  }
}
