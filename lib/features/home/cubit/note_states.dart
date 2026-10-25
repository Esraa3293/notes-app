sealed class NoteStates {
  List<String> notes;

  NoteStates({required this.notes});
}

class NoteInitialState extends NoteStates {
  NoteInitialState({required super.notes});
}

class NoteAddState extends NoteStates {
  NoteAddState({required super.notes});
}

class NoteRemoveState extends NoteStates {
  NoteRemoveState({required super.notes});
}
