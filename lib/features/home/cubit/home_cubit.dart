import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/data_source/hive_data_source.dart';
import 'package:notes_app/features/home/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState()){
    getNotes();
}
  HiveDataSource dataSource = HiveDataSource();

  Future<void> addNote(String newNote) async {
    emit(HomeLoadingState());
    try {
      await dataSource.addNote(newNote);
      List<String> notes = dataSource.getNote();
      emit(HomeDataLoadedState(notes: notes));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  void getNotes() async {
    emit(HomeLoadingState());
    try {
      List<String> notes = dataSource.getNote();
      emit(HomeDataLoadedState(notes: notes));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  Future<void> removeNote(int index) async {
    emit(HomeLoadingState());
    try {
      await dataSource.deleteNote(index);
      List<String> notes = dataSource.getNote();
      emit(HomeDataLoadedState(notes: notes));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
