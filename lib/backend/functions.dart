import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/components/search_bar.dart';
import 'package:news_app/utils/key.dart';

Future<List> fetchNews() async {
  String query = CustomSearchBar.searchController.text;
  if (query == '') {
    query = 'news';
  }
  final response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&apiKey=${ApiKey.key}"),
  );

  Map result = jsonDecode(response.body);
  // print('data fetched: ' + (result['articles']).toString());

  return (result['articles']);
}
