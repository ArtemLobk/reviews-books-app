import 'package:flutter/material.dart';
import 'book.dart';

class AddBookPage extends StatefulWidget {
  final Function(Book) onBookAdded;

  const AddBookPage({super.key, required this.onBookAdded});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Book Title'),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _rating,
              min: 0,
              max: 5,
              divisions: 5,
              label: _rating.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
            Text('Rating: ${_rating.toStringAsFixed(1)}'),
            const SizedBox(height: 20),
            TextField(
              controller: _reviewController,
              decoration:
                  const InputDecoration(labelText: 'Write a short review'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty && _rating > 0) {
                  final newReview = Review(
                    reviewerName: 'Anonymous',
                    reviewText: _reviewController.text,
                  );

                  final newBook = Book(
                    title: _titleController.text,
                    rating: _rating,
                    reviews: [newReview],
                  );
                  widget.onBookAdded(newBook);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
