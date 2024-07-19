import 'package:flutter/material.dart';
import '../datamodels/episode_item_model.dart';
import '../locator.dart';
import '../services/api.dart';

class EpisodesViewModel extends ChangeNotifier {
  final _api = locator<Api>();

  List<EpisodeItemModel>? _episodes;
  List<EpisodeItemModel>? get episodes => _episodes;

  Future getEpisodes() async {
    var episodeResults = await _api.getEpisodes();
    print('episodeResults is String --- > ${episodeResults is String}');

    if (episodeResults is String) {
      // show error
    } else {
      _episodes = episodeResults;
    }

    notifyListeners();
  }
}
