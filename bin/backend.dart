import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/vacancy_api.dart';
import 'infra/custom_server.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');
  var cascadeHandler =
      Cascade().add(LoginApi().handler).add(VacancyApi().handler).handler;
  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);
  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
