part of 'RegisterImports.dart';

class RegisterData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericBloc<ColorModel?> colorsCubit = GenericBloc(null);
  final GenericBloc<List<ValidateColorModel>> validateColorsCubit =
      GenericBloc([]);
  final GenericBloc<bool> startWithACubit = GenericBloc(false);
  final GenericBloc<bool> isErrorCubit = GenericBloc(false);
  final GenericBloc<String> isErrorCubitS = GenericBloc('');

  TextEditingValue textEditingValue = new TextEditingValue();

  final TextEditingController firstController = new TextEditingController();
  final TextEditingController secondController = new TextEditingController();
  TextEditingController thirdController = new TextEditingController();
  final TextEditingController forthController = new TextEditingController();

  List<String> suggestions = [];

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
      });
    }
  }

  validateFirst(String text) {
    if (firstController.text.startsWith('a')) {
      startWithACubit.onUpdateData(true);
    } else {
      startWithACubit.onUpdateData(false);
    }
  }

  validateSecond(String text, BuildContext context) {
    var color = validateColorsCubit.state.data
        .where((element) => element.color == text);
    String colorName = color.map((e) => e.color).toString();
    String errorMsg = color.map((e) => e.errorMessage).toString();
    if (text.trim().isEmpty) {
      return 'Please enter this field';
    }
    if ('(${text.trim()})' == colorName.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMsg),
        duration: Duration(milliseconds: 1500),
      ));
      return errorMsg;
    }
  }

  getColors(BuildContext context) async {
    var data = await GeneralRepository(context).getColors();
    if (data != null) {
      colorsCubit.onUpdateData(data);
      validateColorsCubit
          .onUpdateData(data.colorsGroupModel.asyncValidationColors);
      suggestions =
          colorsCubit.state.data!.colorsGroupModel.autoSuggestionsColors;
      forthController.text = colorsCubit.state.data!.red;
    }
  }
}
