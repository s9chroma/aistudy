import 'package:flutter/material.dart';

import 'create_module.dart';
import 'create_node.dart';

enum ItemType { nodes, modules }

class CreatePage extends StatefulWidget {
  final Function closeCreatePage;
  final ItemType type;

  const CreatePage(
      {super.key, required this.closeCreatePage, required this.type});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  String getPageName() {
    if(widget.type == ItemType.modules) {
      return "Create Module";
    } else {
      return "Create Node";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getPageName()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.closeCreatePage();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: (widget.type == ItemType.modules)
            ? CreateModule(closeCreatePage: widget.closeCreatePage,)
            : const CreateNode(),
      ),
    );
  }
}
