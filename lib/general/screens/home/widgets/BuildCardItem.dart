part of 'HomeWidgetsImports.dart';

class BuildCardItem extends StatelessWidget {
  final ItemModel model;
  const BuildCardItem({
    Key? key,required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                MyText(
                    title: model.fullNameAR,
                    color: MyColors.primary,
                    size: 12),
                MyText(
                  title: model.mobileNumber,
                  color: MyColors.black,
                  size: 11,
                ),
              ],
            ),
            Column(
              children: [
                MyText(
                    title: model.amount.toString(),
                    color: Colors.red,
                    size: 12),
                MyText(
                  title: 'ريال سعودي',
                  color: MyColors.black,
                  size: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
