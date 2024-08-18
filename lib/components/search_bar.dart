import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/backend/functions.dart';
import 'package:news_app/utils/colors.dart';

class CustomSearchBar extends StatefulWidget {
  static TextEditingController searchController =
      TextEditingController(text: '');
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 60,
          margin: const EdgeInsets.all(10),
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Expanded(
                    child: TextFormField(
                  controller: CustomSearchBar.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search any news...',
                    hintStyle: GoogleFonts.lato(),
                    border: InputBorder.none,
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    fetchNews();
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(.7),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
