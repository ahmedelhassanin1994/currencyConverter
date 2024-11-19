import 'package:hive/hive.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';

abstract class LocalDataSource {
  Future<Box> Openbox();
  Future<List<ModelCountry>> getCache();
  Future<void> AddCache(List<ModelCountry> modelcache);
  Future<void> deleteLocal(var tittle);
}

class LocalDataSourceImplementer implements LocalDataSource {
  @override
  Future<void> AddCache(List<ModelCountry> modelcache) async {
    // TODO: implement AddCache
    final box = await Openbox();
    await box.addAll(modelcache);
  }

  @override
  Future<Box> Openbox() async {
    // TODO: implement Openbox
    var box = await Hive.openBox<ModelCountry>(Constant.localKey);
    return box;
  }

  @override
  Future<void> deleteLocal(tittle) async {
    // TODO: implement deleteLocal

     final box = await Openbox();
    // final Map<dynamic, dynamic> deliveriesMap = box.toMap();
    // dynamic desiredKey;
    // if (deliveriesMap.isNotEmpty) {
    //   deliveriesMap.forEach((key, value) {
    //     if (value.key == tittle) {
    //       desiredKey = key;
    //     }
    //   });
      box.clear();

  }

  @override
  Future<List<ModelCountry>> getCache() async {
    // TODO: implement getCache
    final box = await Openbox();
    List<ModelCountry> model = box.values.cast<ModelCountry>().toList();
    return model;
  }
}
