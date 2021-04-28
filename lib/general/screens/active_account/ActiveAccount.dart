part of 'ActiveAccountImports.dart';

class ActiveAccount extends StatefulWidget {
  final String userId;

  const ActiveAccount({required this.userId});

  @override
  _ActiveAccountState createState() => _ActiveAccountState();
}

class _ActiveAccountState extends State<ActiveAccount> {
  ActiveAccountData activeAccountData = new ActiveAccountData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildText(),
          BuildFormInputs(activeAccountData: activeAccountData),
          BuildButtonList(activeAccountData: activeAccountData,userId: widget.userId,),
        ],
      ),
    );
  }
}
