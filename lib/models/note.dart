import 'package:flutter/material.dart';

class Note {
  final String id;
  final String title;
  final String note;
  final DateTime updateAt;
  final DateTime createdAt;
  bool isPinned;

  Note(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.updateAt,
      @required this.createdAt,
      this.isPinned = false});

  Note copyWith({
    String id,
    String title,
    String note,
    DateTime updateAt,
    DateTime createdAt,
    bool isPinned,
  }) {
    return Note(
      id: id == null ? this.id : id,
      title: title == null ? this.title : title,
      note: note == null ? this.note : note,
      updateAt: updateAt == null ? this.updateAt : updateAt,
      createdAt: createdAt == null ? this.createdAt : createdAt,
      isPinned: isPinned == null ? this.isPinned : isPinned,
    );
  }
}
