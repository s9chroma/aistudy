import 'package:hive/hive.dart';

part 'module.g.dart'; // This is the file that will be generated later

@HiveType(typeId: 0)
class Module {
  @HiveField(0)
  final String moduleName;

  @HiveField(1)
  final String moduleId;

  @HiveField(2)
  final List<String> components;

  @HiveField(3)
  final int creditPoints;

  Module(
      {required this.moduleName,
      required this.moduleId,
      required this.components,
      required this.creditPoints});

  @override
  String toString() {
    return 'Module{\n'
        '  moduleName: $moduleName,\n'
        '  moduleId: $moduleId,\n'
        '  components: $components,\n'
        '  creditPoints: $creditPoints,\n'
        '}';
  }
}
