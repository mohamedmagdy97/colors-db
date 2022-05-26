import 'package:colors_db/general/models/add_to_color_model.dart';

class FavoriteColorModel {
  late final List<AddToColorModel> addToTheseColors;

  FavoriteColorModel.fromJson(Map<String, dynamic> json) {
    addToTheseColors = List.from(json['addToTheseColors'])
        .map((e) => AddToColorModel.fromJson(e))
        .toList();
  }
}
