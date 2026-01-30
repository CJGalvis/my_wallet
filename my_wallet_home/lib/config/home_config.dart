import 'package:my_wallet_pockets/domain/gateways/pockets_gateway.dart';
import 'package:my_wallet_pockets/domain/usecases/pockets_usecases.dart';

class HomeConfig {
  final PocketsGateway _pocketsApi;
  late PocketsUseCase pocketsUseCases;

  HomeConfig({required PocketsGateway pocketsApi})
    : _pocketsApi = pocketsApi {
    pocketsUseCases = PocketsUseCase(_pocketsApi);
  }
}
