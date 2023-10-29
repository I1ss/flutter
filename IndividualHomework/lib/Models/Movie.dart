class Movie {
  String? imageSource;
  String? name;
  String? description;
  String? director;
  String? categoryName;
  int? year;
  int? scores;
  int? id;

  Movie({this.imageSource, this.name, this.description, this.director, this.categoryName, this.year, this.scores, this.id});

  Map<String, dynamic> toMap() {
    return {
      'imageSource': imageSource,
      'name': name,
      'description': description,
      'director': director,
      'categoryName': categoryName,
      'year': year,
      'scores': scores,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      imageSource: map['imageSource'],
      name: map['name'],
      description: map['description'],
      director: map['director'],
      categoryName: map['categoryName'],
      year: map['year'],
      scores: map['scores'],
      id: map['id'],
    );
  }
}