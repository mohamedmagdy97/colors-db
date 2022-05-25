class AddToColorModel {
  late final String myFavoriteColor;
  late final String secondFavoriteColor;

  AddToColorModel.fromJson(Map<String, dynamic> json){
    myFavoriteColor = json['myFavoriteColor'];
    secondFavoriteColor = json['secondFavoriteColor'];
  }
}