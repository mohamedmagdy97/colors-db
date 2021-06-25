part of 'AboutImports.dart';
class AboutData{
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  final GenericBloc<String> aboutCubit = new GenericBloc("");

  void fetchData(BuildContext context)async {
    var data = await GeneralRepository(context).aboutApp();
    aboutCubit.onUpdateData("$data");
  }
}