import 'package:flutter/material.dart';
import 'package:flutter_webtoon/models/webtoon_episode_model.dart';
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onButtonTap(snapshot.data![index].id);
                },
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border(
                        top: const BorderSide(width: 1, color: Colors.black26),
                        bottom: index == snapshot.data!.length - 1
                            ? const BorderSide(width: 1, color: Colors.black26)
                            : BorderSide.none,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Row(
                        children: [
                          Image.network(
                            snapshot.data![index].thumb,
                            width: 100,
                            headers: const {
                              "User-Agent":
                                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
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
          );
        }
        return Container();
      },
    );
  }
}
