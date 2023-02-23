import 'package:shelf/shelf.dart';

abstract class SecurityService<E> {
  Future<String> generateJWT(String userID);
  Future<E?> validateJWT(String token);

  Middleware get authentication;
  Middleware get verifyJwt;
}
