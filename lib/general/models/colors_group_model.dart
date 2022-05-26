import 'package:colors_db/general/models/validate_color_model.dart';
import 'package:colors_db/general/models/favorite_color_model.dart';


class ColorsGroupModel {
  late final List<ValidateColorModel> asyncValidationColors;
  late final List<String> autoSuggestionsColors;
  late final FavoriteColorModel personalFavoriteColors;

  ColorsGroupModel.fromJson(Map<String, dynamic> json){
    asyncValidationColors = List.from(json['asyncValidationColors']).map((e)=>ValidateColorModel.fromJson(e)).toList();
    autoSuggestionsColors = List.castFrom<dynamic, String>(json['autoSuggestionsColors']);
    personalFavoriteColors = FavoriteColorModel.fromJson(json['personalFavoriteColors']);
  }

}