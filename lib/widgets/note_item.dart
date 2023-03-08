import 'package:flutter/material.dart';
import 'package:notes/images/custom_icon_icons.dart';

class NoteItem extends StatefulWidget {
  // const NoteItem({Key key}) : super(key: key);
  final String id;
  final String note;
  final String title;
  final bool isPinned;
  final Function(String id) toggleIsPinnedFn;

  NoteItem(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.isPinned,
      @required this.toggleIsPinnedFn});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  bool _isPinned;

  @override
  Widget build(BuildContext context) {
    _isPinned = widget.isPinned;
    print(widget.title);
    return GridTile(
      header: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              widget.toggleIsPinnedFn(widget.id);
            },
            icon: Icon(
              _isPinned ? CustomIcon.pushpin : CustomIcon.pin_outline,
            ),
          )),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue[400]),
        child: Text(widget.note),
        padding: EdgeInsets.all(12),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        child: GridTileBar(
          title: Text(widget.title),
          backgroundColor: Colors.amber[300],
        ),
      ),
    );
  }
}
