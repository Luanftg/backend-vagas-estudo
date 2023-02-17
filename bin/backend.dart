import 'api/login_api.dart';
import 'infra/custom_server.dart';

void main() async {
  await CustomServer().initialize(LoginApi().handler);
}
