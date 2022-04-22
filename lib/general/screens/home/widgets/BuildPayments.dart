part of 'HomeWidgetsImports.dart';

class BuildPayments extends StatelessWidget {
  const BuildPayments({Key? key, required this.homeData}) : super(key: key);

  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PagedListView<int, ItemModel>(
      pagingController: homeData.pagingController,
      padding: const EdgeInsets.only(bottom: 30),
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<ItemModel>(
        noItemsFoundIndicatorBuilder: (context) => NoData(),
        firstPageProgressIndicatorBuilder: (_) =>
            LoadingDialog.showLoadingView(),
        itemBuilder: (context, item, index) => BuildExpandedField(model: item),
      ),
    ));
  }
}
