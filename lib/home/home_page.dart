import 'package:aistudy/hive_service.dart';
import 'package:aistudy/home/module.dart';
import 'package:flutter/material.dart';

import 'create_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  bool showCreate = false;

  List<Module> modules = [];

  refreshPage() async {
    modules = await HiveService.getAllModules();
  }

  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: labelType,
            leading: showLeading
                ? FloatingActionButton(
                    elevation: 0,
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: const Icon(Icons.add),
                  )
                : const SizedBox(),
            trailing: showTrailing
                ? IconButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    icon: const Icon(Icons.more_horiz_rounded),
                  )
                : const SizedBox(),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.book_outlined),
                selectedIcon: Icon(Icons.book),
                label: Text('Modules'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.folder_copy_outlined),
                selectedIcon: Icon(Icons.folder_copy),
                label: Text('Nodes'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
              child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: (showCreate == true)
                ? CreatePage(
                    closeCreatePage: () {
                      setState(() {
                        showCreate = false;
                        refreshPage();
                      });
                    },
                    type: ItemType.modules,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Modules",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: modules.length,
                            itemBuilder: (context, idx) {
                              return ListTile(
                                title: Text(modules[idx].moduleName),
                              );
                            }),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    showCreate = true;
                                  });
                                },
                                child: const Text("Create Module")))
                      ],
                    ),
                  ),
          )),
        ],
      ),
    );
  }
}
