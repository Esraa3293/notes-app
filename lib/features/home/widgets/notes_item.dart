import 'package:flutter/material.dart';
import 'package:notes_app/core/colors_manager.dart';
import 'package:notes_app/core/styles_manager.dart';
import 'package:notes_app/features/home/models/note_model.dart';

class NotesItem extends StatelessWidget {
  final NoteModel noteModel;

  const NotesItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 157,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: noteModel.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(noteModel.content, style: StylesManager.black25W400),
    );
  }
}
