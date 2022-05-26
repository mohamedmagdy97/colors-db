part of 'HomeWidgetsImports.dart';

class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildRowTitle(
              title: 'First',
              value: widget.selectionDataModel.filedOne,
            ),
            BuildRowTitle(
              title: 'Second',
              value: widget.selectionDataModel.filedTwo,
            ),
            BuildRowTitle(
              title: 'Third',
              value: widget.selectionDataModel.filedThree,
            ),
            BuildRowTitle(
              title: 'Forth',
              value: widget.selectionDataModel.filedFour,
            ),
            const SizedBox(height: 30),
            DefaultButton(
              title: 'Back to Main',
              onTap: () => AutoRouter.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
