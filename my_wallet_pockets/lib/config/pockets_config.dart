import '../domain/gateways/pockets_gateway.dart';
import '../domain/usecases/pockets_usecases.dart';

class PocketsConfig {
  late PocketsUseCase pocketsUseCase;

  PocketsConfig({required PocketsGateway pocketsApi}) {
    pocketsUseCase = PocketsUseCase(pocketsApi);
  }
}
