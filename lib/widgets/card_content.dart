import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final String? title;
  final String? description;
  final String? rating;
  final String? url;

  const CardContent({
    Key? key,
    this.title,
    this.description,
    this.rating,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  '$url',
                  fit: BoxFit.fill,
                )
                // child: const Icon(Icons.fastfood),
                ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$description",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$rating",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
