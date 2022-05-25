class SelectionDataModel {
  SelectionDataModel({
    required this.filedOne,
    required this.filedTwo,
    required this.filedThree,
    required this.filedFour,
  });

  String filedOne;
  String filedTwo;
  String filedThree;
  String filedFour;



  Map<String, dynamic> toMap() => {
    "filedOne": filedOne,
    "filedTwo": filedTwo,
    "filedThree": filedThree,
    "filedFour": filedFour,
  };
}
