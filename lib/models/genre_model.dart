class GenreModel {
  GenreModel({required this.id, required this.name});
  final int id;
  final String name;

  factory GenreModel.fromJson(Map json) {
    return GenreModel(id: json['id'], name: json['name']);
  }

  @override
  String toString() {
    return "GenreModel(id: $id , name: $name)";
  }
}
