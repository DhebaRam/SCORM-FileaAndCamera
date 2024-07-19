import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datamodels/episode_item_model.dart';
import '../../viewmodels/episode_list_view_model.dart';
import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel>? episodes;
  EpisodesList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EpisodeListViewModel>(
      create: (context) => EpisodeListViewModel(),
      child: Consumer<EpisodeListViewModel>(
        builder: (context, model, child) => Wrap(
          spacing: 30,
          runSpacing: 30,
          children: <Widget>[
            ...?episodes?.map((episode) => EpisodeItem(model: episode)).toList()
          ],
        ),
      ),
    );
  }
}