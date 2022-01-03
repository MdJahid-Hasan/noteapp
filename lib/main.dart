import 'package:flutter/material.dart';
import 'package:noteapp/screens/create_note/create_note_screen.dart';
import 'package:noteapp/screens/note_details/note_details_screen.dart';
import 'package:noteapp/screens/notes/notes_screen.dart';
import 'package:noteapp/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //TODO: implement inistate

    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme(),
      darkTheme: CustomTheme.darkTheme(),
      themeMode: CustomTheme.currentTheme(),
      home: NotesScreens(),
      routes: {
        NoteDetailsScreen.routeName: (ctx) => NoteDetailsScreen(),
        CreateNoteScreen.routeName: (ctx) => CreateNoteScreen(),
        NotesScreens.routeName: (ctx) => NotesScreens(),
      },
    );
  }
}
