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
      // <-- Provides ExpandableController to its children
      child: Column(
        children: [
          Expandable(
            // <-- Driven by ExpandableController from ExpandableNotifier
            collapsed: ExpandableButton(
              // <-- Expands when tapped on the cover photo
              child: BuildCardItem(model: model),
            ),
            expanded: Column(children: [
              ExpandableButton(
                // <-- Collapses when tapped on
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
                        Divider(),
                        Row(
                          children: [
                            MyText(
                              title: 'رقم التحويل : ',
                              color: MyColors.blackOpacity,
                              size: 13,
                            ),
                            MyText(
                              title: model.trxRef,
                              color: MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'تاريخ التحويل : ',
                              color: MyColors.blackOpacity,
                              size: 13,
                            ),
                            MyText(
                              title: model.trxDate,
                              color: MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MyText(
                              title: 'اسم المنشأه : ',
                              color: MyColors.blackOpacity,
                              size: 13,
                            ),
                            MyText(
                              title: model.fullNameAR,
                              color: MyColors.primary,
                              size: 13,
                            ),
                          ],
                        ),
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
