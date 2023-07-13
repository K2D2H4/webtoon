import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoon/models/webtoon_espisode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;
  onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${int.parse(episode.id) + 1}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade500,
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episode.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              //SizedBox(height: 5,),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
