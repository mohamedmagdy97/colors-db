class HomeModel {
  String fromDate;
  String toDate;
  String trxNumber;
  String userId;
  Map<String, int> filter;

  HomeModel({
    required this.fromDate,
    required this.toDate,
    required this.trxNumber,
    required this.userId,
    required this.filter,
  });

  Map<String, dynamic> toJson() => {
        "FromDate": fromDate,
        "ToDate": toDate,
        "TrxNumber": trxNumber,
        "User_Id": userId,
        "filter": filter,
      };
}
