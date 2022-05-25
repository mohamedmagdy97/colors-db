class ValidateColorModel {
  late final String color;
  late final String error;
  late final String errorMessage;

  ValidateColorModel.fromJson(Map<String, dynamic> json){
    color = json['color'];
    error = json['error'];
    errorMessage = json['errorMessage'];
  }

}
