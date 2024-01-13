class MovieListModel {
  String? createdBy;
  String? description;
  int? favoriteCount;
  int? id;
  String? iso6391;
  int? itemCount;
  List<Items>? items;
  String? name;
  int? page;
  Null? posterPath;
  int? totalPages;
  int? totalResults;

  MovieListModel({
    this.createdBy,
    this.description,
    this.favoriteCount,
    this.id,
    this.iso6391,
    this.itemCount,
    this.items,
    this.name,
    this.page,
    this.posterPath,
    this.totalPages,
    this.totalResults,
  });

  // Named constructor for creating an instance from JSON
  MovieListModel.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    description = json['description'];
    favoriteCount = json['favorite_count'];
    id = json['id'];
    iso6391 = json['iso_639_1'];
    itemCount = json['item_count'];
    if (json['items'] != null) {
      items = (json['items'] as List).map((item) => Items.fromJson(item)).toList();
    }
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  // Named constructor for creating an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'created_by': createdBy,
      'description': description,
      'favorite_count': favoriteCount,
      'id': id,
      'iso_639_1': iso6391,
      'item_count': itemCount,
      'items': items?.map((item) => item.toJson()).toList(),
      'name': name,
      'page': page,
      'poster_path': posterPath,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
    return data;
  }
}

class Items {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;

  Items({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  // Named constructor for creating an instance from JSON
  Items.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids']?.cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country']?.cast<String>();
  }

  // Named constructor for creating an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'name': name,
      'original_name': originalName,
      'first_air_date': firstAirDate,
      'origin_country': originCountry,
    };
    return data;
  }
}
