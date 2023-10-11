import 'package:hive/hive.dart';

import 'home/module.dart';

class HiveService {
  static Future<List<Module>> getAllModules() async {
    final box = await Hive.openBox<Module>('modules');
    return box.values.toList();
  }

  static addModule(Module module) async {
    final box = await Hive.openBox<Module>('modules');
    box.add(module);
  }

  static removeAllModules() async {
    final box = await Hive.openBox<Module>('modules');
    await box.clear();
  }

  static removeModuleById(String moduleId) async {
    final box = await Hive.openBox<Module>('modules');
    final keyToDelete = box.values.toList().indexWhere((module) => module.moduleId == moduleId);
    if (keyToDelete != -1) {
      await box.deleteAt(keyToDelete);
    }
  }
}
