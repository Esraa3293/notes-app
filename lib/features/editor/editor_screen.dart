import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/styles_manager.dart';
import 'package:notes_app/features/home/cubit/note_cubit.dart';
import 'package:notes_app/features/home/cubit/note_states.dart';
import 'package:notes_app/features/home/models/icon_button_model.dart';
import 'package:notes_app/features/home/widgets/custom_icon_button.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<NoteCubit, NoteStates>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      iconButtonModel: IconButtonModel(
                        icon: Icons.arrow_back_ios,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    CustomIconButton(
                      iconButtonModel: IconButtonModel(
                        icon: Icons.remove_red_eye_outlined,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 12),
                    CustomIconButton(
                      iconButtonModel: IconButtonModel(
                        icon: Icons.save_as_outlined,
                        onPressed: () {
                          context.read<NoteCubit>().addNote(controller.text);
                          controller.clear();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text("Title", style: StylesManager.gray48W400),
                TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    label: Text("Type something..."),
                    labelStyle: StylesManager.gray48W400.copyWith(fontSize: 23),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  cursorColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
