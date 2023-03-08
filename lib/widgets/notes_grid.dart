import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_item.dart';

class NotesGrid extends StatefulWidget {
  final List<Note> listNote;
  final Function(String id) toggleIsPinnedFn;
  NotesGrid({this.listNote, this.toggleIsPinnedFn});

  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    List<Note> tempListNote =
        widget.listNote.where((note) => note.isPinned).toList();
    tempListNote
        .addAll(widget.listNote.where((note) => !note.isPinned).toList());
    return Padding(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: tempListNote.length,
        itemBuilder: (ctx, index) => NoteItem(
          id: tempListNote[index].id,
          title: tempListNote[index].title,
          note: tempListNote[index].note,
          isPinned: tempListNote[index].isPinned,
          toggleIsPinnedFn: widget.toggleIsPinnedFn,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
      ),
    );
  }
}
