import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesProvider with ChangeNotifier {
  bool isLoading = true;
  List<Note> notes = [];
  String email = "";
  // Future<Null> Function() _email =

  Future<String> getEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('emailId') ?? '';

    print("get email");
    print(email);
    return email;
  }

  NotesProvider() {
    fetchNotes();
  }

  List<Note> getFilteredNotes(String searchQuery) {
    return notes
        .where((element) =>
            element.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            element.content!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  void sortNotes() {
    notes.sort((a, b) => b.dateadded!.compareTo(a.dateadded!));
  }

  void addNote(Note note) {
    notes.add(note);
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void updateNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[indexOfNote] = note;
    sortNotes();
    notifyListeners();
    ApiService.addNote(note);
  }

  void deleteNote(Note note) {
    int indexOfNote =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(indexOfNote);
    sortNotes();
    notifyListeners();
    ApiService.deleteNote(note);
  }

  void fetchNotes() async {
    print("email fetchnotes ko mil rhi");
    email = await getEmail();
    print(email);
    notes = await ApiService.fetchNotes(email);
    sortNotes();
    isLoading = false;
    notifyListeners();
  }
}
