part of 'HomeWidgetsImports.dart';

class BuildProfileDialog extends StatelessWidget {
  const BuildProfileDialog({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 30),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              backgroundColor: MyColors.primary,
              radius: 40,
              child: Icon(Icons.person, size: 70)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Divider(),
          ),
          MyText(title: user.fullName, color: MyColors.black, size: 13),
          MyText(title: user.email, color: MyColors.primary, size: 13),
        ],
      ),
    );
  }
}
