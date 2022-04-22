part of 'HomeWidgetsImports.dart';

class BuildRowText extends StatelessWidget {
  final String title;
  final String value;

  const BuildRowText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
          title: '$title : ',
          color: MyColors.blackOpacity,
          size: 13,
        ),
        MyText(
          title: value,
          color: MyColors.primary,
          size: 13,
        ),
      ],
    );
  }
}
