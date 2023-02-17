import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    var router = Router();

    router.get(
      '/',
      (Request request) => Response(200, body: 'Primeira rota!'),
    );

    router.get('/ola/mundo/<usuario>', (Request request, String usuario) {
      return Response.ok('Olá Mundo, $usuario!');
    });

    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      return Response.ok('Query eh: $nome');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);
      var user = json['email'];
      var pass = json['pass'];

      if (user == 'admin' && pass == '123456') {
        return Response.forbidden('Acesso Negado!');
      } else {
        return Response.ok('Bem vindo $user');
      }
    });

    return router;
  }
}
