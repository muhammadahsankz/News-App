import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/key.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=9f869f5f18da43f0bb434a057fecf2d2' +
            ApiKey.key +
            '&q=' +
            SearchBar.searchController.text),
  );
  Map result = jsonDecode(response.body);
  print('data fetched');
  return result['articles'];
}
