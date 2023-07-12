import 'package:get_storage/get_storage.dart';

class CacheHelper {
  late GetStorage getStorage;

  static init() async {
    await GetStorage.init();
  }

  getData({required String key}) {
    return getStorage.read(key);
  }

  saveData({required String key, required dynamic value}) async {
    return await getStorage.write(key, value);
  }

  clearData(String key) async {
    return await getStorage.remove(key);
  }
}
