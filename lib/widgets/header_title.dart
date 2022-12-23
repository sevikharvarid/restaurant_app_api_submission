import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_bloc.dart';
import 'package:restaurant_app_api_submission/ui/search_page.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final int titleSize;
  final String subTitle;
  final int subTitleSize;
  final double? height;
  final bool isSearch;
  final bool isBack;
  CustomAppBar({
    Key? key,
    this.title,
    this.subTitle = "",
    this.height,
    this.isSearch = false,
    this.titleSize = 24,
    this.subTitleSize = 14,
    this.isBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(100, height!),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isBack
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios))
                    : SizedBox(),
                Text(
                  "$title",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "$subTitle",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            isSearch
                ? Center(
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => SearchBloc(),
                              child: const SearchPage(),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}
