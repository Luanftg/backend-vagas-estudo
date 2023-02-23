import '../../api/login_api.dart';
import '../../api/vacancy_api.dart';
import '../../models/vacancy_model.dart';
import '../../services/generic_service.dart';
import '../../services/vacancy_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(
      () => SecurityServiceImp(),
    );

    di.register<LoginApi>(
      () => LoginApi(
        di.get(),
      ),
    );

    di.register<GenericService<VacancyModel>>(
      () => VacancyService(),
    );

    di.register<VacancyApi>(
      () => VacancyApi(
        di.get(),
      ),
    );

    return di;
  }
}
