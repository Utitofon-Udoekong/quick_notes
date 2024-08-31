import 'package:flutter/material.dart';
import 'package:quick_notes/components/drawer_tile.dart';
import 'package:quick_notes/pages/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.note),
          ),
          DrawerTile(
            title: 'Notes',
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          DrawerTile(
            title: 'Settings',
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
