import 'package:hive/hive.dart';

class HiveDataSource {
  final Box box = Hive.box('notes');

  Future<void> addNote(String newNote) async {
    await box.add(newNote);
  }

  Future<void> deleteNote(int index) async {
    await box.deleteAt(index);
  }

  List<String> getNote() {
    return box.values.cast<String>().toList();
  }
}
