part of 'home_imports.dart';

class HomeData {
  final GenericBloc<List<ItemModel>> homeBloc = GenericBloc([]);
  final GenericBloc<String> startDateCubit = GenericBloc('2020-01-01');
  final GenericBloc<String> endDateCubit = GenericBloc('2022-05-01');

  PagingController<int, ItemModel> pagingController =
      PagingController(firstPageKey: 1);
  final int pageSize = 10;

  void fetchData(BuildContext context, {required int pageKey}) async {
    var model = HomeModel(
        fromDate: startDateCubit.state.data,
        toDate: endDateCubit.state.data,
        trxNumber: '',
        // userId: context.read<UserCubit>().state.model.id,
        userId: '',
        filter: {'PageNumber': pageKey, 'PageSize': pageSize});
    var data = await GeneralRepository(context).home(model);
    homeBloc.onUpdateData(data!.data);

    if (data != null) {
      List<ItemModel> adds = data.data;
      homeBloc.onUpdateData(adds);
      if (pageKey == 1) {
        pagingController.itemList = [];
      }
      final isLastPage = adds.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(adds);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(adds, nextPageKey);
      }
    }
  }

  void logout(BuildContext context) {
    LoadingDialog.showLoadingDialog();
    Future.delayed(
      Duration(seconds: 2),
      () {
        EasyLoading.dismiss();
        Utils.clearSavedData();
        AutoRouter.of(context).replaceAll([LoginRoute()]);
      },
    );
  }
}
