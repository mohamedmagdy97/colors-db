class RegisterModel {
  String userName;
  String phone;
  String password;
  List<String> roles;
  String email;

  RegisterModel({
    required this.userName,
    required this.phone,
    required this.password,
    required this.roles,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "FullName": userName,
        "PhoneNumber": phone,
        "Password": password,
        "Email": email,
        "Roles": roles,
      };
}
