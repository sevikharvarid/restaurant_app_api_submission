import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_event.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_event.dart';
import 'package:restaurant_app_api_submission/bloc/search/search_state.dart';
import 'package:restaurant_app_api_submission/common/constants/strings.dart';
import 'package:restaurant_app_api_submission/ui/detail_page.dart';
import 'package:restaurant_app_api_submission/widgets/card_content.dart';
import 'package:restaurant_app_api_submission/widgets/custom_error_indicator.dart';
import 'package:restaurant_app_api_submission/widgets/custom_not_found_indicator.dart';
import 'package:restaurant_app_api_submission/widgets/custom_loading_indicator.dart';
import 'package:restaurant_app_api_submission/widgets/header_title.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
        title: AppStrings.searchTitle,
        titleSize: 30,
        height: 120,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                onSubmitted: (value) {
                  context.read<SearchBloc>().add(
                        SearchStarted(
                          query: value,
                        ),
                      );
                },
                decoration: InputDecoration(
                  hintText: "Find your restaurants here ...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchNotFound) {
                    return const CustomNotFoundIndicator();
                  }
                  if (state is SearchError) {
                    return const CustomErrorIndicator();
                  }
                  if (state is SearchLoading) {
                    return const CustomLoadingIndicator();
                  }
                  if (state is SearchLoaded) {
                    final datas =
                        context.read<SearchBloc>().searchData!.restaurants;
                    return ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => DetailBloc()
                                    ..add(DetailStarted(id: datas[index].id)),
                                  child: const DetailPage(),
                                ),
                              ),
                            );
                          },
                          child: CardContent(
                            url:
                                "https://${AppStrings.baseUrl}/images/medium/${datas[index].pictureId}",
                            title: datas[index].name,
                            description: datas[index].description,
                            rating: datas[index].rating.toString(),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
