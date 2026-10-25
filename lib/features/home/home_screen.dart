import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/colors_manager.dart';
import 'package:notes_app/core/styles_manager.dart';
import 'package:notes_app/features/home/cubit/note_cubit.dart';
import 'package:notes_app/features/home/cubit/note_states.dart';
import 'package:notes_app/features/home/models/icon_button_model.dart';
import 'package:notes_app/features/home/models/note_model.dart';
import 'package:notes_app/features/home/widgets/custom_icon_button.dart';
import 'package:notes_app/features/home/widgets/notes_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Color> noteColors = [
    ColorsManager.secondaryColor,
    ColorsManager.tertiaryColor,
    ColorsManager.surfaceColor,
    ColorsManager.backgroundColor,
    ColorsManager.surfaceTintColor,
    ColorsManager.shadowColor,
  ];

  // bool isAdded = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<NoteCubit, NoteStates>(
            listener: (context, state) {
              if (state is NoteAddState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Note Added"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              if (state is NoteRemoveState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Note Removed"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) => Column(
              children: [
                Row(
                  children: [
                    Text("Notes", style: StylesManager.white43W600),
                    Spacer(),
                    CustomIconButton(
                      iconButtonModel: IconButtonModel(
                        icon: Icons.search,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 12),
                    CustomIconButton(
                      iconButtonModel: IconButtonModel(
                        icon: Icons.info_outline,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        context.read<NoteCubit>().removeNote(index);
                      },
                      background: Container(
                        width: 500,
                        height: 157,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      child: NotesItem(
                        noteModel: NoteModel(
                          content: state.notes[index],
                          color: noteColors[index % noteColors.length],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.transparent),
                    itemCount: state.notes.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, "editor");
            // final result = await Navigator.pushNamed(context, "editor");
            // if (result != null && result is String && result.trim().isNotEmpty) {
            //   if (context.mounted) {
            //     context.read<NoteCubit>().addNote(result);
            //   }
            // }
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.black, size: 30),
        ),
      ),
    );
  }
}
