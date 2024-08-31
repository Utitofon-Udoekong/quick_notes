import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  const NoteSettings(
      {super.key, required this.onEditPressed, required this.onDeletePressed});

  final void Function() onEditPressed;
  final void Function() onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditPressed();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: Text('Edit')),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeletePressed();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: Text('Delete')),
          ),
        ),
      ],
    );
  }
}
