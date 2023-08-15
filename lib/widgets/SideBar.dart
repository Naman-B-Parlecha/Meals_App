import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onshowScreen});
  final void Function(String identifier) onshowScreen;
  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.red.withOpacity(0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "cooking up",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.dining),
            title: const Text("Menu", style: TextStyle(color: Colors.white)),
            onTap: () {
              onshowScreen("Menu");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Filters", style: TextStyle(color: Colors.white)),
            onTap: () {
              onshowScreen("Filter");
            },
          )
        ],
      ),
    );
  }
}
