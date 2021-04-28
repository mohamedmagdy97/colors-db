part of 'AboutWidgetsImports.dart';

class BuildAboutView extends StatelessWidget {
  final String text;

  const BuildAboutView({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          HeaderLogo(),
          Html(
            data: text,
          ),
        ],
      ),
    );
  }
}
