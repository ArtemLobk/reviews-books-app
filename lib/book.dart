class Review {
  String reviewerName;
  String reviewText;

  Review({required this.reviewerName, required this.reviewText});
}

class Book {
  String title;
  double rating;
  List<Review> reviews;

  Book({
    required this.title,
    required this.rating,
    this.reviews = const [],
  });
}
