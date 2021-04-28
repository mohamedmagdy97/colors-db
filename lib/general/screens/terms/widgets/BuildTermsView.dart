part of 'TermsWidgetsImports.dart';

class BuildTermsView extends StatelessWidget {
  final String text;

  const BuildTermsView({required this.text});

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
