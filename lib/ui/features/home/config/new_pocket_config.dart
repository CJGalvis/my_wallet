import '../domain/gateways/pockets_gateway.dart';
import '../domain/usecases/pockets_usecases.dart';

class NewPocketConfig {
  final PocketsGateway _pocketsApi;
  late PocketsUseCase pocketsUseCases;

  NewPocketConfig(this._pocketsApi) {
    pocketsUseCases = PocketsUseCase(_pocketsApi);
  }
}
