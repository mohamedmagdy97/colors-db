part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeData homeData = HomeData();

  @override
  void initState() {
    homeData.fetchData(context, pageKey: 1);
    homeData.pagingController.addPageRequestListener((pageKey) {
      homeData.fetchData(context, pageKey: pageKey);
    });
    super.initState();
  }

  void _showOverlay(BuildContext context) {
    print('lol');
    Navigator.of(context).push(BuildSearchDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: 'مدفوعات هلا',
        leading: Container(),
      ),
      body: Stack(
        children: [
          Image.asset(
            Res.bg,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BlocBuilder<GenericBloc<List<ItemModel>>,
              GenericState<List<ItemModel>>>(
            bloc: homeData.homeBloc,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return Column(
                  children: [
                    const SizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                  title: 'إجمالي المدفوعات',
                                  color: MyColors.primary,
                                  size: 12),
                              FittedBox(
                                child: MyText(
                                    title:
                                        '${state.data.map((e) => e.amount).toList().reduce((a, b) => a + b)} ريال ',
                                    color: MyColors.primary,
                                    size: 12),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => _showOverlay(context),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.13,
                            height: 40,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(Res.filter),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: PagedListView<int, ItemModel>(
                      pagingController: homeData.pagingController,
                      padding: const EdgeInsets.only(bottom: 70),
                      shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate<ItemModel>(
                        noItemsFoundIndicatorBuilder: (context) => Center(
                          child: MyText(
                            title: 'لا يوجد بيانات',
                            color: MyColors.primary,
                            size: 14,
                          ),
                        ),
                        firstPageProgressIndicatorBuilder: (_) =>
                            LoadingDialog.showLoadingView(),
                        itemBuilder: (context, item, index) =>
                            BuildExpandedField(model: item),
                      ),
                    )),
                  ],
                );
              } else {
                return LoadingDialog.showLoadingView();
              }
            },
          )
        ],
      ),
    );
  }
}
