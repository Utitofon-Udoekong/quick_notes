import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_notes/models/note.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initalize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  final List<Note> currentNotes = [];

  Future<void> addNote(String text) async {
    final newNote = Note()..text = text;
    await isar.writeTxn(() => isar.notes.put(newNote));
  }

  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  Future<void> updateNote(int id, String newText) async {
    final exsitingNote = await isar.notes.get(id);
    if (exsitingNote != null) {
      exsitingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(exsitingNote));
      await fetchNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
