import 'package:flutter/material.dart';
import 'package:webtoon/widget/detail_screen.dart';

class Webtoon extends StatelessWidget {
  Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  final String title, thumb, id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.3),
                    )
                  ]),
              child: Image.network(thumb),
              width: 250,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
