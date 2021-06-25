part of 'TermsImports.dart';

class TermsData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  final GenericBloc<String> termsCubit = new GenericBloc("");

  void fetchData(BuildContext context)async {
    var data = await GeneralRepository(context).terms();
    termsCubit.onUpdateData("$data");
  }

}
