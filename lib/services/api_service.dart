import 'dart:convert';
import 'dart:developer';

import 'package:notes_app/models/note.dart';
import 'package:http/http.dart' as https;

class ApiService {
  static String _baseUrl = "https://notes-backend-ruddy.vercel.app/notes";

  static Future<void> addNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl + "/add");
    var response = await https.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse(_baseUrl + "/delete");
    var response = await https.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Note>> fetchNotes(String userid) async {
    Uri requestUri = Uri.parse(_baseUrl + "/lists");
    var response = await https
        .post(requestUri, body: {"userid": 'ChiragSinghal2001@gmail.com'});
    print("hello");
    print(response.body);
    var decoded = jsonDecode(response.body);

    List<Note> notes = [];
    for (var noteMap in decoded) {
      Note newNote = Note.fromMap(noteMap);
      notes.add(newNote);
    }

    return notes;
  }
}
