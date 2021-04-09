part of 'AboutImports.dart';
class AboutData{
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  final GenericCubit<String> aboutCubit = new GenericCubit("");

  void fetchData(BuildContext context)async {
    var data = await GeneralRepository(context).aboutApp();
    aboutCubit.onUpdateData(data);
  }
}