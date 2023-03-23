import 'package:flutter/material.dart';
import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EpisodeList extends StatelessWidget {
  const EpisodeList({
    super.key,
    required this.episodes,
    required this.webtoonId,
  });

  final Future<List<WebtoonEpisodeModel>> episodes;
  final String webtoonId;

  void onButtonTap(String episodeId) async {
    await launchUrlString(
        'https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=$episodeId');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: episodes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              for (var episode in snapshot.data!)
                GestureDetector(
                  onTap: () {
                    onButtonTap(episode.id);
                  },
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.black26),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            ImageNetwork(
                              image: episode.thumb,
                              height: 70,
                              width: 100,
                              onTap: () {
                                onButtonTap(episode.id);
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                episode.title,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      )),
                )
            ],
          );
        }
        return Container();
      },
    );
  }
}
