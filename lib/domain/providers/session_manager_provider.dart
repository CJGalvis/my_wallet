import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_session_manager/user_session_manager.dart';

part 'session_manager_provider.g.dart';

@riverpod
SessionManager sessionManager(Ref ref) {
  return SessionManager();
}
