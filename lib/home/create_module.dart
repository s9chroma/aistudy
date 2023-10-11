import 'package:aistudy/hive_service.dart';
import 'package:aistudy/home/module.dart';
import 'package:flutter/material.dart';

class CreateModule extends StatefulWidget {
  final Function closeCreatePage;
  const CreateModule({super.key, required this.closeCreatePage});

  @override
  State<CreateModule> createState() => _CreateModuleState();
}

class _CreateModuleState extends State<CreateModule> {
  final TextEditingController _moduleNameController = TextEditingController();

  final TextEditingController _moduleIdController = TextEditingController();

  final TextEditingController _creditPointsController = TextEditingController();

  final TextEditingController _componentController = TextEditingController();

  final List<String> _selectedComponents = [];

  bool _isModuleIdUnique(String moduleId) {
    // TODO: Implement logic to check if module ID is unique.
    // For now, we'll return true to indicate it's unique
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // HiveService.getAllModules().then((value) => print(value));
    return ListView(
      children: [
        TextField(
          maxLines: 1,
          minLines: 1,
          controller: _moduleNameController,
          decoration: const InputDecoration(
            labelText: 'Module Name',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: InputBorder.none,
            isDense: true,
            labelStyle: TextStyle(height: -0.5),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _moduleIdController,
          decoration: InputDecoration(
            labelText: 'Module ID',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            errorText: !_isModuleIdUnique(_moduleIdController.text)
                ? 'Module ID is not unique!'
                : null,
            border: InputBorder.none,
            isDense: true,
            labelStyle: const TextStyle(height: -0.5),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _componentController,
          decoration: const InputDecoration(
            hintText: 'Type and press enter to add component',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _selectedComponents.add(value);
                _componentController.clear();
              });
            }
          },
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: _selectedComponents.map((component) {
            return Chip(
              label: Text(component),
              onDeleted: () {
                setState(() {
                  _selectedComponents.remove(component);
                });
              },
            );
          }).toList(),
        ),
        Visibility(
            visible: (_selectedComponents.isNotEmpty),
            child: const SizedBox(height: 10)),
        TextField(
          controller: _creditPointsController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Credit Points',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: InputBorder.none,
            isDense: true,
            labelStyle: TextStyle(height: -0.5),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                onPressed: () async {
                  Module newModule = Module(
                      moduleName: _moduleNameController.text,
                      moduleId: _moduleIdController.text,
                      components: _selectedComponents,
                      creditPoints:
                          int.tryParse(_creditPointsController.text) ?? 0);
                  await HiveService.addModule(newModule);
                  widget.closeCreatePage();
                },
                child: const Text("Save")))
      ],
    );
  }
}
