part of 'HomeWidgetsImports.dart';


class BuildFilterDialog extends StatelessWidget {
  const BuildFilterDialog({
    Key? key,
    required this.homeData,
  }) : super(key: key);

  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyText(title: 'من تاريخ', color: MyColors.primary, size: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: BlocBuilder<GenericBloc, GenericState>(
              bloc: homeData.startDateCubit,
              builder: (context, state) {
                return DatePickerWidget(
                  looping: false,
                  firstDate: DateTime(2019, 01, 01),
                  initialDate: DateTime(2020, 01, 01),
                  dateFormat: "dd/MMMM/yyyy",
                  onChange: (DateTime newDate, _) {
                    homeData.startDateCubit.onUpdateData(newDate.toString());

                    print('===============${state.data}');
                  },
                  pickerTheme: DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
          MyText(title: 'إلى تاريخ', color: MyColors.primary, size: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: BlocBuilder<GenericBloc, GenericState>(
              bloc: homeData.endDateCubit,
              builder: (context, state) {
                return DatePickerWidget(
                  looping: false,
                  firstDate: DateTime(2020, 01, 01),
                  initialDate: DateTime(2022, 05, 01),
                  dateFormat: "dd/MMMM/yyyy",
                  onChange: (DateTime newDate, _) {
                    homeData.endDateCubit.onUpdateData(newDate.toString());
                  },
                  pickerTheme: DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              DefaultButton(
                title: 'تحديد',
                width: MediaQuery.of(context).size.width * 0.3,
                onTap: () =>
                    AutoRouter.of(context).pop({'start': '11', 'end': '22'}),
              ),
              DefaultButton(
                title: 'إلغاء',
                width: MediaQuery.of(context).size.width * 0.25,
                onTap: () => Navigator.pop(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
