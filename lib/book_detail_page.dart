import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove shadow for a flat design
      ),
      body: Container(
        color: Colors.white, // Neutral white background
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Book Title Section
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color:
                        Colors.black87, // Dark gray text for a minimalist feel
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Book Cover (Placeholder image)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:
                      Colors.grey[200], // Soft gray background for book cover
                ),
                width: 150,
                height: 200,
                child: const Icon(
                  Icons.book_outlined,
                  size: 80,
                  color: Colors.grey, // Gray icon for the minimalist style
                ),
              ),

              // Rating Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (starIndex) => Icon(
                    starIndex < book.rating.floor()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.black38, // Lighter gray for the star color
                    size: 24, // Moderate star size
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Rating Text
              Text(
                '${book.rating} / 5',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54, // Soft gray text for rating
                ),
              ),
              const SizedBox(height: 24),

              // Short Review Header
              const Text(
                'Short Review:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54, // Soft gray text
                ),
              ),
              const SizedBox(height: 12),

              // Review Text or No Review Text
              book.reviews.isNotEmpty
                  ? Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          book.reviews.first.reviewText,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54, // Soft gray for text
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'No reviews available.',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color:
                                Colors.black38, // Subtle gray for "No reviews"
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

              // Thin Divider to separate content sections
              const Divider(
                color: Colors.black12,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
