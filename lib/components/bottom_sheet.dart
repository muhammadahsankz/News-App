import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
  BuildContext context,
  String title,
  String description,
  String imageUrl,
  String url,
) {
  showBottomSheet(
    backgroundColor: AppColors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,
    context: context,
    builder: (context) {
      return MyBottomSheetLayout(
        url: url,
        imageUrl: imageUrl,
        title: title,
        description: description,
      );
    },
  );
}

Future<void> _launchUrl(String url) async {
  try {
    await launchUrl(
      Uri.parse(url),
    );
  } catch (error) {
    print(error.toString());
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, url, imageUrl;
  const MyBottomSheetLayout({
    super.key,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
                color: AppColors.white, size: 16, text: description),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Read Full Article',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl(url);
                    },
                  style: GoogleFonts.lato(
                    color: Colors.blue.shade400,
                  ))
            ])),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
