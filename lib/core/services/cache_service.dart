import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

class CacheService {
  static const String storiesBox = 'stories';
  static const String usersBox = 'users';
  static const Duration cacheValidity = Duration(hours: 1);

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(storiesBox);
    await Hive.openBox(usersBox);
  }

  static Future<void> cacheData(
      String boxName, String key, dynamic data) async {
    final box = Hive.box(boxName);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    await box.put(key, {
      'data': json.encode(data),
      'timestamp': timestamp,
    });
  }

  static dynamic getCachedData(String boxName, String key) {
    final box = Hive.box(boxName);
    final cachedData = box.get(key);

    if (cachedData == null) return null;

    final timestamp = cachedData['timestamp'] as int;
    final now = DateTime.now().millisecondsSinceEpoch;

    if (now - timestamp > cacheValidity.inMilliseconds) {
      box.delete(key);
      return null;
    }

    return json.decode(cachedData['data']);
  }
}
