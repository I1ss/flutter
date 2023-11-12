class Note {
  int? id;
  String text;
  int filmId;

  Note({
    this.id,
    required this.text,
    required this.filmId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'film_id': filmId,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      text: map['text'],
      filmId: map['film_id'],
    );
  }
}