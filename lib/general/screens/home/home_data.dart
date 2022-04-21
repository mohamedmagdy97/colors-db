part of 'home_imports.dart';

class HomeData {
  GenericBloc<List<ItemModel>> homeBloc = GenericBloc([]);

  PagingController<int, ItemModel> pagingController =
      PagingController(firstPageKey: 1);
  final int pageSize = 10;

  void fetchData(
    BuildContext context, {
    required int pageKey,
  }) async {
    var model = HomeModel(
        fromDate: '2020-01-01',
        toDate: '2022-05-01',
        trxNumber: '',
        // userId: context.read<UserCubit>().state.model.id,
        userId: '',
        filter: {
          'PageNumber': pageKey,
          'PageSize': pageSize,
        });
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

// openQuestions(int index) {
//   questionBloc.state.data[index].closed =
//   !questionBloc.state.data[index].closed;
//   questionBloc.onUpdateData(questionBloc.state.data);
// }
}
