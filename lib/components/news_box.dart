import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/bottom_sheet.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class NewsBox extends StatelessWidget {
  final String imageUrl, title, time, description, url;
  const NewsBox(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: screenWidth,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: ((context, imageProvider) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.yellow),
                      )),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModifiedText(color: AppColors.white, size: 16, text: title),
                    ModifiedText(
                        color: AppColors.lightWhite, size: 12, text: time)
                  ],
                ))
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
