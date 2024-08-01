import 'package:fantasy_triathlon_league/create_team/model/selected_athletes_data_model.dart';
import 'package:fantasy_triathlon_league/utils/app_strings.dart';
import 'package:fantasy_triathlon_league/utils/image.dart';
import 'package:get/get.dart';

class SelectAthleteController extends GetxController {
  RxList selectedMale = <int>[].obs;

  List<SelectedAthletesDataModel> male = [
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: AppStrings.markKelly,
        score: "1245 pts",
        country: "Uk"),
  ];

  List<SelectedAthletesDataModel> female = [
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
    SelectedAthletesDataModel(
        image: ImageAsset.profilePic,
        name: "Mary Worre",
        score: "1245 pts",
        country: "Uk"),
  ];

  void toggleSelectionOfMale(int index) {
    if (selectedMale.contains(index)) {
      selectedMale.remove(index);
    } else {
      if (selectedMale.length < 5) {
        selectedMale.add(index);
      } else {
        print("Cannot select more than 5 male athletes.");
      }
    }
    update();
  }

  RxList selectedFemale = <int>[].obs;

  void toggleSelectionOfFemale(int index) {
    if (selectedFemale.contains(index)) {
      selectedFemale.remove(index);
    } else {
      if (selectedFemale.length < 5) {
        selectedFemale.add(index);
      }
    }
    update();
  }
}
