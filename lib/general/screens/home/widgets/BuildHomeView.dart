part of 'HomeWidgetsImports.dart';

class BuildHomeView extends StatelessWidget {
  const BuildHomeView({
    Key? key,
    required this.homeData,
  }) : super(key: key);

  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<ItemModel>>,
        GenericState<List<ItemModel>>>(
      bloc: homeData.homeBloc,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          String amount = '';
          if (state.data.length > 0) {
            amount = state.data
                .map((e) => e.amount)
                .toList()
                .reduce((a, b) => a + b)
                .toString();
          } else {
            amount = '0';
          }
          return Column(
            children: [
              const SizedBox(height: 90),
              BuildTotalAndFilter(amount: amount, homeData: homeData),
              BuildPayments(homeData: homeData),
            ],
          );
        } else {
          return LoadingDialog.showLoadingView();
        }
      },
    );
  }
}



