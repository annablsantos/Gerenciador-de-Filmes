class Movie {
  int? id;
  String title;
  String imageUrl;
  String genre;
  String ageRating;
  String duration;
  double rating;
  String description;
  int releaseYear;

  Movie({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.genre,
    required this.ageRating,
    required this.duration,
    required this.rating,
    required this.description,
    required this.releaseYear,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'genre': genre,
      'ageRating': ageRating,
      'duration': duration,
      'rating': rating,
      'description': description,
      'releaseYear': releaseYear,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      genre: map['genre'],
      ageRating: map['ageRating'],
      duration: map['duration'],
      rating: map['rating'],
      description: map['description'],
      releaseYear: map['releaseYear'],
    );
  }
}
