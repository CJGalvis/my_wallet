import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import 'cloud_firestore_service.dart';
import 'google_auth_service.dart';

class FirebaseService {
  final GoogleAuthService _googleAuthService;
  final CloudFirestoreService _cloudService;

  FirebaseService({
    GoogleAuthService? googleAuthService,
    CloudFirestoreService? cloudService,
  })  : _googleAuthService = googleAuthService ?? GoogleAuthService(),
        _cloudService = cloudService ?? CloudFirestoreService();

  Future<(ErrorItem?, Map<String, dynamic>?)> login(
    String email,
    String password,
  ) async {
    try {
      User? user =
          await _googleAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      if (user == null) {
        throw (
          ErrorItem(
            message: 'Credenciales inválidas',
            code: 001,
            description: '',
          ),
          null,
        );
      }

      final Map<String, dynamic>? userCloud =
          await _cloudService.getUser(email);

      final token = await user.getIdToken();

      return Future.value((
        null,
        {
          'name': userCloud?['username'],
          'email': user.email,
          'photo': userCloud?['photoURL'],
          'token': token,
        }
      ));
    } catch (e) {
      throw Future.value((
        ErrorItem(
          code: 001,
          message:
              'Error al intentar cargar los datos de la autenticación',
          description: '',
        ),
        null
      ));
    }
  }

  Future<(ErrorItem?, Map<String, dynamic>?)> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      User? user =
          await _googleAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );

      if (user == null) {
        throw (
          ErrorItem(
            message: "Error al realizar el registro",
            code: 002,
            description: '',
          ),
          null
        );
      }

      await _cloudService.saveNewUser({
        'username': name,
        'email': email,
        'photo': '',
      });

      final token = await user.getIdToken();

      return Future.value((
        null,
        {
          'name': name,
          'email': user.email,
          'photo': '',
          'token': token,
        }
      ));
    } catch (e) {
      throw Future.value((
        ErrorItem(
          code: 001,
          message:
              'Error al intentar cargar los datos de la autenticación',
          description: '',
        ),
        null
      ));
    }
  }

  Future<(ErrorItem?, Map<String, dynamic>?)> googleAuth() async {
    try {
      User? user = await _googleAuthService.signInWithGoogle();

      if (user == null) {
        return (
          ErrorItem(
              message: "Google sign-in cancelled",
              code: 001,
              description: ''),
          null
        );
      }

      final Map<String, dynamic>? userDb =
          await _cloudService.getUser(user.email!);

      if (userDb == null) {
        await _cloudService.saveNewUser({
          'username': user.displayName,
          'email': user.email,
          'photo': user.photoURL,
        });
      }

      final token = await user.getIdToken();

      return Future.value((
        null,
        {
          'name': user.displayName,
          'email': user.email,
          'photo': user.photoURL,
          'token': token,
        }
      ));
    } catch (e) {
      throw Future.value((
        ErrorItem(
          code: 001,
          message:
              'Error al intentar cargar los datos de la autenticación',
          description: '',
        ),
        null
      ));
    }
  }
}
