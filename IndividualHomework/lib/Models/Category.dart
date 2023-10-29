class Category {
  String? imageSource;
  String? categoryName;

  Category({this.categoryName, this.imageSource});

  Map<String, dynamic> toMap() {
    return {
      'imageSource': imageSource,
      'categoryName': categoryName,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      imageSource: map['imageSource'],
      categoryName: map['categoryName'],
    );
  }
}