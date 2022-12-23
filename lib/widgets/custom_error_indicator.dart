import 'package:flutter/material.dart';

class CustomErrorIndicator extends StatelessWidget {
  const CustomErrorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: const [
            Icon(
              Icons.error_outline,
              size: 150,
            ),
            Text(
              "Oops... Somethings Gone wrong !",
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
