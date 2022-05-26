part of 'HomeWidgetsImports.dart';

class BuildRowTitle extends StatelessWidget {
  final String title;
  final String value;

  const BuildRowTitle({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: title,
              color: MyColors.black,
              size: 16,
              fontFamily: GoogleFonts.josefinSans().fontFamily,
            ),
            MyText(
              title: value,
              color: MyColors.primary,
              size: 14,
              fontFamily: GoogleFonts.josefinSans().fontFamily,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
