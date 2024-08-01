import 'package:fantasy_triathlon_league/create_team/model/athlete_overview.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTeamController extends GetxController {
  Rx<TextEditingController> teamNameController = TextEditingController().obs;

  final teamKey = GlobalKey<FormState>();

  List<AthleteOverview> infoList = [
    AthleteOverview(
      logo: ImageAsset.swim,
      title: AppStrings.swimPace,
      subTitle: "1.26/100m",
    ),
    AthleteOverview(
      logo: ImageAsset.bike,
      title: AppStrings.bikePace,
      subTitle: "131.8KM/H",
    ),
    AthleteOverview(
      logo: ImageAsset.run,
      title: AppStrings.runPace,
      subTitle: "00:03:45/km",
    ),
  ];
}
