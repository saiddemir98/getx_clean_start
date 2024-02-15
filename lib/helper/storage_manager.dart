import 'package:hive_flutter/hive_flutter.dart';

import '../base/base_service.dart';
import '../core/constant/storage.dart';

class StorageManager extends BaseService {
  late Box _box;
  final String boxName = StorageConstant.BOX_NAME;
  Future<StorageManager> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(boxName);
    return this;
  }

  dynamic clearAll() {
    return _box.clear();
  }

  dynamic clearValue(String key) {
    return _box.delete(key);
  }

  dynamic getData(dynamic key) {
    return _box.get(key);
  }

  dynamic setData(String key, dynamic value) {
    return _box.put(key, value);
  }
}
