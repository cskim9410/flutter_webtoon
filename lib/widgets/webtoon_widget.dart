import 'package:flutter/material.dart';
import 'package:flutter_webtoon/screens/detail_screen.dart';
import 'package:image_network/image_network.dart';

class WebtoonCard extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonCard({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  void navigate(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          title: title,
          thumb: thumb,
          id: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(context);
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(10, 10),
                    spreadRadius: 5,
                    blurRadius: 15,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: ImageNetwork(
                image: thumb,
                height: 300,
                width: 250,
                onTap: () {
                  navigate(context);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
