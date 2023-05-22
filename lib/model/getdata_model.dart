
class GetDataResults {
/*
{
  "adult": false,
  "backdrop_path": "/i1eghEBiC0gN4KnwuUGC2fNiX1f.jpg",
  "id": 552688,
  "title": "The Mother",
  "original_language": "en",
  "original_title": "The Mother",
  "overview": "A deadly female assassin comes out of hiding to protect the daughter that she gave up years before, while on the run from dangerous men.",
  "poster_path": "/vnRthEZz16Q9VWcP5homkHxyHoy.jpg",
  "media_type": "movie",
  "genre_ids": [
    28
  ],
  "popularity": 101.326,
  "release_date": "2023-05-04",
  "video": false,
  "vote_average": 6.585,
  "vote_count": 82
} 
*/

  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int?>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  GetDataResults({
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
  });
  GetDataResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
    id = json['id']?.toInt();
    title = json['title']?.toString();
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    posterPath = json['poster_path']?.toString();
    mediaType = json['media_type']?.toString();
    if (json['genre_ids'] != null) {
      final v = json['genre_ids'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      genreIds = arr0;
    }
    popularity = json['popularity']?.toDouble();
    releaseDate = json['release_date']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['genre_ids'] = arr0;
    }
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class GetData {
/*
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/i1eghEBiC0gN4KnwuUGC2fNiX1f.jpg",
      "id": 552688,
      "title": "The Mother",
      "original_language": "en",
      "original_title": "The Mother",
      "overview": "A deadly female assassin comes out of hiding to protect the daughter that she gave up years before, while on the run from dangerous men.",
      "poster_path": "/vnRthEZz16Q9VWcP5homkHxyHoy.jpg",
      "media_type": "movie",
      "genre_ids": [
        28
      ],
      "popularity": 101.326,
      "release_date": "2023-05-04",
      "video": false,
      "vote_average": 6.585,
      "vote_count": 82
    }
  ],
  "total_pages": 1000,
  "total_results": 20000
} 
*/

  int? page;
  List<GetDataResults?>? results;
  int? totalPages;
  int? totalResults;

  GetData({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  GetData.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <GetDataResults>[];
      v.forEach((v) {
        arr0.add(GetDataResults.fromJson(v));
      });
      results = arr0;
    }
    totalPages = json['total_pages']?.toInt();
    totalResults = json['total_results']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
