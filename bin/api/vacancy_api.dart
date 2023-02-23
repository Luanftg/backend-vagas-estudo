import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/vacancy_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class VacancyApi extends Api {
  final GenericService<VacancyModel> _service;

  VacancyApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    router.get('/vacancy', (Request req) {
      List<VacancyModel> vacancyList = _service.findAll();
      List<Map> vacancyMap = vacancyList.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(vacancyMap));
    });

    router.post('/vacancy', (Request req) async {
      var body = await req.readAsString();
      var vacancy = VacancyModel.fromMap(jsonDecode(body));
      var saved = _service.save(vacancy);
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
    return createHandler(
      router: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
