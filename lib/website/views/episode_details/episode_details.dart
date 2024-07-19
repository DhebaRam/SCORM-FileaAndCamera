import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/episode_details_view_model.dart';

class EpisodeDetails extends StatelessWidget {
  final int? id;
  const EpisodeDetails({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EpisodeDetailsViewModel>(
      create: (context) => EpisodeDetailsViewModel()..getEpisodeData(id!),
      child: Consumer<EpisodeDetailsViewModel>(
        builder: (context, model, child) => Center(
          child: Column(
            children: <Widget>[
              if (model.episode == null)
                Container()
              else
                SizedBox(
                  height: 320,
                  child: Image.network(
                    model.episode?.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              if (model.episode == null)
                const CircularProgressIndicator()
              else
                Text(
                  model.episode?.title ?? '',
                  style: const TextStyle(fontSize: 60),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
