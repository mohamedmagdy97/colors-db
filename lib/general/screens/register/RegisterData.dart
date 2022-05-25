part of 'RegisterImports.dart';

class RegisterData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericBloc<ColorModel?> colorsCubit = GenericBloc(null);

  final GenericBloc<bool> startWithACubit = GenericBloc(false);
  final TextEditingController forthController = new TextEditingController();
  TextEditingController thirdController = new TextEditingController();
  TextEditingValue textEditingValue = new TextEditingValue();
  final TextEditingController secondController = new TextEditingController();
  final TextEditingController firstController = new TextEditingController();

  void doneValidate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      SelectionDataModel selectionDataModel = SelectionDataModel(
        filedOne: firstController.text,
        filedTwo: secondController.text,
        filedThree: thirdController.text,
        filedFour: forthController.text,
      );
      AutoRouter.of(context)
          .push(HomeRoute(selectionDataModel: selectionDataModel))
          .then((value) {
        firstController.clear();
        secondController.clear();
        thirdController.clear();
        forthController.clear();
      });
    }
  }

  List<String> suggestions = [];

  validateFirst() {
    if (firstController.text.startsWith('a')) {
      startWithACubit.onUpdateData(true);
    } else {
      startWithACubit.onUpdateData(false);
    }
  }

  getColors(BuildContext context) async {
    var res = await GeneralRepository(context).getColors();
    if (res != null) {
      colorsCubit.onUpdateData(res);
      suggestions =
          colorsCubit.state.data!.colorsGroupModel.autoSuggestionsColors;
      forthController.text = colorsCubit.state.data!.red;
    }
  }
}
