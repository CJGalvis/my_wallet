import '../domain/gateways/records_gateway.dart';
import '../domain/usecases/records_usecases.dart';

class RecordConfig {
  late RecordsUseCase recordsUseCase;

  RecordConfig({required RecordsGateway recordsApi}) {
    recordsUseCase = RecordsUseCase(recordsApi);
  }
}
