part of 'HomeWidgetsImports.dart';

class BuildExpandedField extends StatelessWidget {
  final ItemModel model;

  const BuildExpandedField({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Column(
        children: [
          Expandable(
            collapsed: ExpandableButton(child: BuildCardItem(model: model)),
            expanded: Column(children: [
              ExpandableButton(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const Divider(),
                        BuildRowText(title: 'رقم التحويل', value: model.trxRef),
                        BuildRowText(
                            title: 'تاريخ التحويل', value: model.trxDate),
                        BuildRowText(
                            title: 'اسم المنشأه', value: model.fullNameAR),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
