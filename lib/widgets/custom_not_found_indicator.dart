import 'package:flutter/material.dart';

class CustomNotFoundIndicator extends StatelessWidget {
  const CustomNotFoundIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: const [
            Icon(
              Icons.search_off,
              size: 150,
            ),
            Text(
              "We can't finding restaurant for you.",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "Please try again ...",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
