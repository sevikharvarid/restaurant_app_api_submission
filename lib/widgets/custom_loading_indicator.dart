import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: const [
            Icon(
              Icons.search,
              size: 150,
            ),
            Text(
              "Finding restaurant for you.",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Please wait",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
