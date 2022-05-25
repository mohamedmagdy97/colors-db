part of 'RegisterWidgetsImports.dart';

class BuildSuggestionField extends StatelessWidget {
  const BuildSuggestionField({
    Key? key,
    required this.registerData,
  }) : super(key: key);

  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 16),
      MyText(title: 'Select Color', color: MyColors.black, size: 12),
      Autocomplete<String>(
        initialValue: registerData.textEditingValue,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return registerData.suggestions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        displayStringForOption: (val) {
          return val;
        },
       fieldViewBuilder:
            (context, controllerView, focusNode, onEditingComplete) {
          registerData.thirdController = controllerView;
          return TextFormField(
            focusNode: focusNode,
            controller: registerData.thirdController,
            validator: (value) => value!.validateEmpty(context),
            decoration: WidgetUtils.setInputDecoration(
              hint: 'suggestion',
              enableColor: MyColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              hintColor: MyColors.primary,
              radius: const BorderRadius.all(Radius.circular(4)),
            ),
          );
        },
      ),
    ]);
  }
}
