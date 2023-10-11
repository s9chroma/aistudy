import 'package:flutter/material.dart';

class CreateNode extends StatefulWidget {
  const CreateNode({super.key});

  @override
  State<CreateNode> createState() => _CreateNodeState();
}

class _CreateNodeState extends State<CreateNode> {
  final TextEditingController _nodeNameController = TextEditingController();

  final TextEditingController _nodeIdController = TextEditingController();

  final TextEditingController _creditPointsController = TextEditingController();

  bool _isNodeIdUnique(String nodeId) {
    // TODO: Implement logic to check if module ID is unique.
    // For now, we'll return true to indicate it's unique
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextField(
          maxLines: 1,
          minLines: 1,
          controller: _nodeNameController,
          decoration: const InputDecoration(
            labelText: 'Node Name',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: InputBorder.none,
            isDense: true,
            labelStyle: TextStyle(height: -0.5),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _nodeIdController,
          decoration: InputDecoration(
            labelText: 'Node ID',
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            errorText: !_isNodeIdUnique(_nodeIdController.text)
                ? 'Node ID is not unique!'
                : null,
            border: InputBorder.none,
            isDense: true,
            labelStyle: const TextStyle(height: -0.5),
          ),
        ),
        const SizedBox(height: 10),
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
            child: ElevatedButton(onPressed: () {}, child: const Text("Save")))
      ],
    );
  }
}
