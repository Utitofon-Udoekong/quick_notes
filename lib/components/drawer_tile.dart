import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({super.key, required this.title, required this.leading, required this.onTap});

  final String title;
  final Widget leading;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leading,
      onTap: onTap,
    );
  }
}
