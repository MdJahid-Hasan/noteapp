import 'package:flutter/material.dart';
import 'package:noteapp/modal/note.dart';
import 'package:noteapp/screens/create_note/create_note_screen.dart';
import 'package:noteapp/screens/note_details/note_details_screen.dart';
import 'package:noteapp/themes/custom_theme.dart';

class NotesScreens extends StatelessWidget {
  static const routeName = "/notesscreen";
  const NotesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Notes"),
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.toggleTheme();
              },
              icon: CustomTheme.currentTheme() == ThemeMode.dark
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, NoteDetailsScreen.routeName,
                  arguments: Note.notes[index]);
            },
            title: Text(
              Note.notes[index].title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              Note.notes[index].description,
              style: Theme.of(context).textTheme.bodyText2,
              //lines control
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        itemCount: Note.notes.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateNoteScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
