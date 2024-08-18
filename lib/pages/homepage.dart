import 'package:flutter/material.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/components/appbar.dart';
import 'package:news_app/components/news_box.dart';
import 'package:news_app/components/search_bar.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
              child: SizedBox(
            width: screenWidth,
            child: FutureBuilder<List>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            imageUrl: snapshot.data![index]['urlToImage'] ??
                                Constants.defaultImageUrl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                            url: snapshot.data![index]['url'],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }
                }),
          ))
        ],
      ),
    );
  }
}
