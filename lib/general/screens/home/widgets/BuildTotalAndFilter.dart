part of 'HomeWidgetsImports.dart';

class BuildTotalAndFilter extends StatelessWidget {
  const BuildTotalAndFilter({
    Key? key,
    required this.amount,
    required this.homeData,
  }) : super(key: key);

  final String amount;
  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          width: MediaQuery.of(context).size.width * 0.75,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: 'إجمالي المدفوعات', color: MyColors.primary, size: 12),
              FittedBox(
                child: MyText(
                    title: '$amount ريال ', color: MyColors.primary, size: 12),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            showDialog(
                    context: context,
                    builder: (_) => BuildFilterDialog(homeData: homeData))
                .then((value) {
              homeData.fetchData(context, pageKey: 1);

              homeData.pagingController.addPageRequestListener((pageKey) {
                homeData.fetchData(context, pageKey: pageKey);
              });
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.13,
            height: 40,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Image.asset(Res.filter),
          ),
        ),
      ],
    );
  }
}
