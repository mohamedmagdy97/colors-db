part of 'HomeWidgetsImports.dart';

class BuildTotalAndFilter extends StatelessWidget {
  const BuildTotalAndFilter({Key? key, required this.homeData})
      : super(key: key);

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
              BlocBuilder<GenericBloc, GenericState>(
                bloc: homeData.amountCubit,
                builder: (context, state) {
                  return FittedBox(
                    child: MyText(
                        title: '${state.data} ريال ',
                        color: MyColors.primary,
                        size: 12),
                  );
                },
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            showDialog(
                    context: context,
                    builder: (_) => BuildFilterDialog(homeData: homeData))
                .then((value) =>
                    (value) ? homeData.fetchData(context, pageKey: 1) : null);
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
