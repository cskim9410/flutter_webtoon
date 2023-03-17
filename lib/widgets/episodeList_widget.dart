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
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onButtonTap(snapshot.data![index].id);
                  },
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        border: Border(
                          top:
                              const BorderSide(width: 1, color: Colors.black26),
                          bottom: index == snapshot.data!.length - 1
                              ? const BorderSide(
                                  width: 1, color: Colors.black26)
                              : BorderSide.none,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            ImageNetwork(
                              image: snapshot.data![index].thumb,
                              height: 70,
                              width: 100,
                              onTap: () {
                                onButtonTap(snapshot.data![index].id);
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data![index].title,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      )),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
