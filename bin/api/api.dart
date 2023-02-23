import 'package:shelf/shelf.dart';

import '../infra/dependency_injector/dependency_injector.dart';
import '../infra/security/security_service.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false});

  Handler createHandler(
      {required Handler router,
      List<Middleware>? middlewares,
      bool isSecurity = false}) {
    middlewares ??= [];

    if (isSecurity) {
      final _securityService = DependencyInjector().get<SecurityService>();
      middlewares = [
        _securityService.authentication,
        _securityService.verifyJwt
      ];
    }
    var pipe = Pipeline();
    middlewares.forEach(
      (m) => pipe = pipe.addMiddleware(m),
    );
    return pipe.addHandler(router);
  }
}
