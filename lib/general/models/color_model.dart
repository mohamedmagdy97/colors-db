import 'package:colors_db/general/models/colors_group_model.dart';

class ColorModel {
  late final String red;
  late final ColorsGroupModel colorsGroupModel;

  ColorModel.fromJson(Map<String, dynamic> json){
    red = json['red'];
    colorsGroupModel = ColorsGroupModel.fromJson(json['groupOfColors']);
  }
}






