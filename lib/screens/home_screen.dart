import 'package:flutter/material.dart';
import 'package:notes/screens/add_note_screen.dart';
import 'package:notes/widgets/notes_grid.dart';
import '../models/note.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _listNote = [
    Note(
      id: 'n1',
      title: 'Mereka adalah kita ',
      note: 'catatan',
      createdAt: DateTime.parse('2021-05-20 22:52:44'),
      updateAt: DateTime.parse('2022-06-13 33:55:33'),
    ),
    Note(
      id: 'n2',
      title: 'Catatan si unyil',
      note: 'catatan',
      createdAt: DateTime.parse('2021-05-20 22:52:44'),
      updateAt: DateTime.parse('2022-06-13 33:55:33'),
    ),
    Note(
      id: 'n3',
      title: 'Bumbu Khas Masakan Aceh ',
      note: 'catatan',
      createdAt: DateTime.parse('2021-05-20 22:52:44'),
      updateAt: DateTime.parse('2022-06-13 33:55:33'),
    ),
    Note(
      id: 'n3',
      title: 'Fajar anak Belawan sok Kontol',
      note: 'catatan',
      createdAt: DateTime.parse('2021-05-20 22:52:44'),
      updateAt: DateTime.parse('2022-06-13 33:55:33'),
    ),
  ];

  void toggleIsPined(String id) {
    int index = _listNote.indexWhere((note) => note.id == id);
    if (index >= 0) {
      setState(() {
        _listNote[index].isPinned = !_listNote[index].isPinned;
      });
    }
  }

  void addNote(Note note) {
    setState(() {
      _listNote.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Center(child: Text('Notes')),
      ),
      body: NotesGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => AddNoteScreen(addNote),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
