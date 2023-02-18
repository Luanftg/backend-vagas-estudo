import '../db/fake_db.dart';
import '../models/vacancy_model.dart';
import 'generic_service.dart';

class VacancyService implements GenericService<VacancyModel> {
  @override
  bool delete(int id) {
    FakeDB.vacancyList.removeWhere((element) => element['id'] == id);
    var alreadyOnList =
        FakeDB.vacancyList.every((element) => element['id'] == id);
    return !alreadyOnList;
  }

  @override
  List<VacancyModel> findAll() {
    var mappedList = FakeDB.vacancyList;
    var vacancyList = mappedList.map((e) => VacancyModel.fromMap(e)).toList();
    return vacancyList;
  }

  @override
  VacancyModel? findOne(int id) {
    var map = FakeDB.vacancyList.firstWhere((element) => element['id'] == id);
    if (map.isEmpty) {
      return null;
    } else {
      var vacancy = VacancyModel.fromMap(map);
      return vacancy;
    }
  }

  @override
  bool save(VacancyModel value) {
    var map = value.toMap();
    if (map['id'] == 0) {
      map.addAll({'id': FakeDB.vacancyList.length + 1});
      FakeDB.vacancyList.add(map);
    } else {
      int index =
          FakeDB.vacancyList.indexWhere((element) => element['id'] == value.id);

      if (index > 0) FakeDB.vacancyList.insert(index, map);
    }
    var isOnList = FakeDB.vacancyList.contains(map);
    return isOnList;
  }
}
