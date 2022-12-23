import 'dart:convert';

import 'package:flutter_application_1/Components/searchbar.dart';
import 'package:flutter_application_1/utils/key.dart';
import 'package:http/http.dart' as http;


Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=' +
            Key.key +
            '&q=' +
            SearchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
