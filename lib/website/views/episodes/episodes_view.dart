import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datamodels/season_details_model.dart';
import '../../viewmodels/episodes_view_model.dart';
import '../../widgets/episodes_list/episodes_list.dart';
import '../../widgets/season_details/season_details.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EpisodesViewModel>(
      create: (context) {
        final model = EpisodesViewModel();
        try {
          model.getEpisodes();
        } catch (e) {
          print('Error fetching episodes: $e');
        }
        return model;
      },
      child: Consumer<EpisodesViewModel>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 100),
                SeasonDetails(
                  details: SeasonDetailsModel(
                    title: 'SEASON 1',
                    description: 'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
                  ),
                ),
                const SizedBox(height: 50),
                model.episodes == null
                    ? const CircularProgressIndicator()
                    : EpisodesList(episodes: model.episodes),
              ],
            ),
          );
        },
      ),
    );
  }
}