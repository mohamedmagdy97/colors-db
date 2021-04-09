part of 'ChangePasswordImports.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ChangePasswordData changePasswordData = new ChangePasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'تغيير كلمة المرور') ,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          BuildChangeForm(changePasswordData: changePasswordData),
          BuildSaveButton(changePasswordData: changePasswordData),
        ],
      ),
    );
  }
}
