import 'dart:convert';

import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final url = Uri.parse('https://ranakshetram.vercel.app/api/v1/keyword');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.title.toLowerCase();
        final description = book.description.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            description.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

class Book {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  const Book({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['_id'],
        description: json['description'],
        title: json['title'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
      };
}
