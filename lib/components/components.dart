import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';

class BottomSheetImage extends StatelessWidget {
  final String imageUrl, title;
  const BottomSheetImage(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.black, AppColors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: BoldText(text: title, size: 18, color: AppColors.white),
              ))
        ],
      ),
    );
  }
}
