import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/colors_manager.dart';
import 'package:notes_app/features/editor/editor_screen.dart';
import 'package:notes_app/features/home/cubit/note_cubit.dart';
import 'package:notes_app/features/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: ColorsManager.primaryColor),
        initialRoute: "home",
        routes: {
          "home": (context) => HomeScreen(),
          "editor": (context) => EditorScreen(),
        },
      ),
    );
  }
}
