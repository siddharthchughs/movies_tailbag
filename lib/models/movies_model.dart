class MoviesModel {
  bool? adult;
  String? backdropPath;
  List<int> genreIds;
  int? id;
  String? originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool? video;
  double voteAverage;
  int voteCount;

  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MoviesModel.fromJson(Map mapJson) {
    return MoviesModel(
      adult: mapJson['adult'],
      backdropPath: mapJson['backdrop_path'],
      genreIds: mapJson['genre_ids'].cast<int>(),
      id: mapJson['id'],
      originalLanguage: mapJson['original_language'],
      originalTitle: mapJson['original_title'],
      overview: mapJson['overview'],
      popularity: mapJson['popularity'],
      posterPath: mapJson['poster_path'],
      releaseDate: mapJson['release_date'],
      title: mapJson['title'],
      video: mapJson['video'],
      voteAverage: mapJson['vote_average'],
      voteCount: mapJson['vote_count'],
    );
  }

  // MoviesModel.fromJson(Map<String, dynamic> json) {
  //   page = json['page'];
  //   if (json['results'] != null) {
  //     results = <Results>[];
  //     json['results'].forEach((v) {
  //       results!.add(Results.fromJson(v));
  //     });
  //   }
  //   totalPages = json['total_pages'];
  //   totalResults = json['total_results'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['page'] = page;
  //   if (results != null) {
  //     data['results'] = results!.map((v) => v.toJson()).toList();
  //   }
  //   data['total_pages'] = totalPages;
  //   data['total_results'] = totalResults;
  //   return data;
  // }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  @override
  String toString() {
    return "MoviesModel(adult:$adult,$backdropPath,$originalTitle)";
  }
}
