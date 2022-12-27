import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/detail/detail_state.dart';
import 'package:restaurant_app_api_submission/common/constants/strings.dart';
import 'package:restaurant_app_api_submission/widgets/custom_divider.dart';
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
          if (state is DetailLoading) {
            return const CustomLoadingIndicator();
          }
          if (state is DetailLoaded) {
            final datas = context.read<DetailBloc>().detailData!.restaurant;
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Image.network(
                          "https://${AppStrings.baseUrl}/images/medium/${datas.pictureId}",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 5,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
