class Movie {
  String name;
  String genre;
  int rating;
  String description;
  bool saved;
  String imageURL;
  List<String> cast;

  Movie(
      {this.name,
      this.imageURL,
      this.description,
      this.saved,
      this.genre,
      this.cast,
      this.rating});

  Movie.map(Map<String, dynamic> obj) {
    this.name = obj['name'];
    this.genre = obj['genre'];
    this.rating = obj['rating'];
    this.description = obj['description'];
    this.saved = obj['saved'];
    this.imageURL = obj['imageURL'];
    this.cast = new List<String>.from(obj['cast']);
  }
}
