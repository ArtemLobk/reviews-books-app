import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (starIndex) => Icon(
                  starIndex < book.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Rating: ${book.rating}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text('Short Review:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            // Check if there are reviews
            book.reviews.isNotEmpty
                ? Text(
                    book.reviews.first.reviewText,
                    style: const TextStyle(fontSize: 18),
                  )
                : const Text(
                    'No reviews available.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
          ],
        ),
      ),
    );
  }
}
