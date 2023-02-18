import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class VacancyApi {
  Handler get handler {
    Router router = Router();

    router.get('/vacancy', (Request req) {
      return Response.ok('Api Vacancy');
    });
    return router;
  }
}
