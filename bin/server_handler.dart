import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    var router = Router();

    router.get(
      '/',
      (Request request) => Response(200, body: 'Primeira rota!'),
    );
    return router;
  }
}
