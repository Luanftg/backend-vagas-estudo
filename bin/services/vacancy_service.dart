import '../models/vacancy_model.dart';
import '../utils/list_extension.dart';
import 'generic_service.dart';

class VacancyService implements GenericService<VacancyModel> {
  List<VacancyModel> _fakeDB = [];
  @override
  bool delete(int id) {
    var exist = _fakeDB.any((element) => element.id == id);
    if (exist) {
      _fakeDB.removeWhere((element) => element.id == id);
      return true;
    } else {
      return false;
    }
  }

  @override
  List<VacancyModel> findAll() {
    return _fakeDB;
  }

  @override
  VacancyModel? findOne(int id) {
    VacancyModel? model =
        _fakeDB.firstWhereOrNull((element) => element.id == id);
    if (model == null) {
      return null;
    } else {
      return model;
    }
  }

  @override
  bool save(VacancyModel value) {
    VacancyModel? model =
        _fakeDB.firstWhereOrNull((element) => element.id == value.id);
    if (model == null) {
      _fakeDB.add(value);
    } else {
      int index = _fakeDB.indexWhere((element) => element.id == value.id);

      if (index > 0) _fakeDB.insert(index, value);
    }
    return _fakeDB.contains(value);
  }
}
