class Note {
  var title;
  var description;
  var id;
  Note(this.id, this.title, this.description);

  static List<Note> notes = [
    Note(1, "Shopping List", "1. Chicken 2. Burger 3.Milk"),
    Note(2, "Going for walk", "Today I want to go for walk in the morning"),
    Note(3, "Shopping List", "1. Chicken 2. Burger 3.Milk"),
  ];
}
