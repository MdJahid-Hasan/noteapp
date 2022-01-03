import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/modal/note.dart';
import 'package:noteapp/screens/notes/notes_screen.dart';

class NoteDetailsScreen extends StatefulWidget {
  static const routeName = "/noteDetails";
  const NoteDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;
    titleEditingController = TextEditingController(text: note.title);
    descriptionEditingController =
        TextEditingController(text: note.description);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // remove note from the list

                  Note.notes.remove(note);

                  //go to the notescreen
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, NotesScreens.routeName);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "please enter title";
                    }
                  },
                  controller: titleEditingController,
                  decoration:
                      InputDecoration(hintText: "title", labelText: "title *"),
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "please enter description";
                    }
                  },
                  controller: descriptionEditingController,
                  decoration: InputDecoration(
                      hintText: "description", labelText: "description *"),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String title = titleEditingController.text;
                        String description = descriptionEditingController.text;
                        print(title + description);
                        var random = new Random();
                        int id = random.nextInt(1000);
                        Note note = Note(id, title, description);
                        Note.notes.add(note);

                        for (Note note1 in Note.notes) {
                          if (note1.id == note.id) {
                            note.title == title;
                            note1.description = description;
                          }
                        }
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, NotesScreens.routeName);
                      }
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ));
  }
}




/*
class NoteDetailsScreen extends StatefulWidget {
  static const routeName = "/noteDetails";
  const NoteDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Note note = ModalRoute.of(context)!.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
              onPressed: () {
                //remove note from the list
                Note.notes.remove(note);

                //go to the notescreen
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, NotesScreens.routeName);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          note.description,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
*/