import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_state.dart';
import 'package:restaurant_app_api_submission/common/constants/strings.dart';
import 'package:restaurant_app_api_submission/widgets/custom_divider.dart';
import 'package:restaurant_app_api_submission/widgets/custom_error_indicator.dart';
import 'package:restaurant_app_api_submission/widgets/custom_loading_indicator.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String address;
  final String description;
  final String rating;

  const DetailPage(
      {Key? key,
      this.address = "Address here",
      this.description = "Description",
      this.name = "Restaurant Name",
      this.rating = "9.0"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailError) {
            return const Center(
              child: CustomErrorIndicator(),
            );
          }
          if (state is DetailLoading) {
            // return const CustomLoadingIndicator();
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is DetailLoaded) {
            final datas = context.read<DetailBloc>().detailData!.restaurant;
            final menus =
                context.read<DetailBloc>().detailData!.restaurant.menus;
            return NestedScrollView(
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    iconTheme: IconThemeData(color: Colors.white),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                        tag: 'name',
                        child: Material(
                          color: Colors.transparent,
                          child: Image.network(
                            "https://${AppStrings.baseUrl}/images/medium/${datas.pictureId}",
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ),
                    ),
                    centerTitle: false,
                  ),
                ];
              },
              body: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            datas.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            datas.address,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const CustomDivider(),
                          Text(
                            datas.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const CustomDivider(),
                          Row(
                            children: [
                              const Text(
                                "${AppStrings.rating} : ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                datas.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Drinks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const CustomDivider(),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menus.drinks.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.local_drink,
                                size: 50,
                              ),
                              decoration: BoxDecoration(color: Colors.orange),
                              margin: EdgeInsets.symmetric(vertical: 10),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(menus.drinks[index].name)
                          ],
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Foods",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const CustomDivider(),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: menus.foods.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.food_bank,
                                size: 50,
                              ),
                              decoration: BoxDecoration(color: Colors.orange),
                              margin: EdgeInsets.symmetric(vertical: 10),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(menus.foods[index].name)
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
