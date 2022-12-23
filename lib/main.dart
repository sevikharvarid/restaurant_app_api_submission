import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_bloc.dart';
import 'package:restaurant_app_api_submission/bloc/home/home_event.dart';
import 'package:restaurant_app_api_submission/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc()..add(HomeStarted()),
        child: HomePage(),
      ),
    );
  }
}
