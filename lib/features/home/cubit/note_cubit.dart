import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/cubit/note_states.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState(notes: []));

  void addNote(String newNote) {
    List<String> updateList = List.from(state.notes);
    updateList.add(newNote);
    emit(NoteAddState(notes: updateList));
  }

  void removeNote(int index) {
    List<String> updateList = List.from(state.notes);
    updateList.removeAt(index);
    emit(NoteRemoveState(notes: updateList));
  }
}
