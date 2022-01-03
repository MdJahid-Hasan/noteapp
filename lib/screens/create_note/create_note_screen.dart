import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/modal/note.dart';
import 'package:noteapp/screens/notes/notes_screen.dart';

class CreateNoteScreen extends StatefulWidget {
  static const routeName = "/createnotescreen";
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.bodyText1,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please Enter note Title";
                  }
                },
                controller: titleEditingController,
                decoration: InputDecoration(
                  hintText: "title",
                  labelText: "title*",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              TextFormField(
                style: Theme.of(context).textTheme.bodyText2,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please Enter note Description";
                  }
                },
                controller: descriptionEditingController,
                decoration: InputDecoration(
                  hintText: "description",
                  labelText: "description*",
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Container(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    String title = titleEditingController.text;
                    String description = descriptionEditingController.text;
                    print(title + description);
                    var random = new Random();
                    int id = random.nextInt(1000);

                    // add this note to the list
                    Note note = Note(id, title, description);
                    Note.notes.add(note);

                    // go to notescreen
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                        context, NotesScreens.routeName);
                  }
                },
                child: Text("Create"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
