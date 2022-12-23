import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_event.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_state.dart';
import 'package:restaurant_app_api_submission/common/constants/strings.dart';
import 'package:restaurant_app_api_submission/ui/detail_page.dart';
import 'package:restaurant_app_api_submission/widgets/card_content.dart';
import 'package:restaurant_app_api_submission/widgets/custom_loading_indicator.dart';
import 'package:restaurant_app_api_submission/widgets/header_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isSearch: true,
        title: AppStrings.title,
        subTitle: AppStrings.subTitle,
        height: 120,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final data = context.read<HomeBloc>().listData?.restaurants;
          if (state is HomeLoading) {
            return const Center(child: CustomLoadingIndicator());
          }
          if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => DetailBloc()
                            ..add(DetailStarted(id: data[index].id)),
                          child: const DetailPage(),
                        ),
                      ),
                    );
                  },
                  child: CardContent(
                    url:
                        "https://${AppStrings.baseUrl}/images/medium/${data[index].pictureId}",
                    title: data[index].name,
                    description: data[index].description,
                    rating: data[index].rating.toString(),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
