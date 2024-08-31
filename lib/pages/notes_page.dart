import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quick_notes/components/app_drawer.dart';
import 'package:quick_notes/components/note_tile.dart';
import 'package:quick_notes/models/note.dart';
import 'package:quick_notes/server/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(textController.text);
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Note'),
          backgroundColor: Theme.of(context).colorScheme.surface,
          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNote(note.id, textController.text);
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final notesDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = notesDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: GoogleFonts.abrilFatface()
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
