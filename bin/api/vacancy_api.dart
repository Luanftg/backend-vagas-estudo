import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/vacancy_model.dart';
import '../services/generic_service.dart';
import '../utils/custom_env.dart';

class VacancyApi {
  final GenericService _service;

  VacancyApi(this._service);

  Handler get handler {
    Router router = Router();

    router.get('/vacancy', (Request req) {
      var vacancyList = _service.findAll();
      var jsonResponse = vacancyList.map((e) => e.toJson()).toList().toString();
      return Response(200,
          body: jsonResponse, headers: {'content-type': 'application/json'});
    });

    router.post('/vacancy', (Request req) async {
      var body = await req.readAsString();
      var vacancy = VacancyModel.fromMap(jsonDecode(body));
      var saved = _service.save(vacancy);
      saved ? await CustomEnv.writeFile(jsonEncode(vacancy)) : false;
      return saved ? Response(201) : Response.internalServerError();
    });

    router.put('/vacancy', (Request req) async {
      var body = await req.readAsString();
      if (body.isNotEmpty) {
        var vacancy = VacancyModel.fromMap(jsonDecode(body));
        var updated = _service.save(vacancy);
        return updated ? Response(204) : Response.internalServerError();
      }
      return Response.badRequest();
    });

    // /vacancy?id=1
    router.delete('/vacancy', (Request req) {
      String? id = req.url.queryParameters['id'];
      if (id != null) {
        bool deleted = _service.delete(int.parse(id));
        return deleted ? Response(204) : Response(500);
      }
      return Response.badRequest();
    });
    return router;
  }
}
