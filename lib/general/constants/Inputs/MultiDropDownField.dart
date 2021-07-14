import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../MyColors.dart';
import 'text_field_style/CustomInputTextStyle.dart';

class MultiDropDownField<T> extends StatelessWidget {

  final List<T> data;
  final List<T> selectedItems;
  final String title;
  final String label;
  final Function(List<T>) onConfirm;
  final Function(T) onItemClick;

  const MultiDropDownField({
    required this.data,
    required this.selectedItems,
    required this.title,
    required this.label,
    required this.onConfirm,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return  MultiSelectBottomSheetField<T>(
      initialChildSize: 0.5,
      listType: MultiSelectListType.LIST,
      searchable: true,
      buttonText: Text(label,style: CustomInputTextStyle(lang: lang,textColor: MyColors.blackOpacity),),
      title: MyText(title: title, color: MyColors.black, size: 12),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(8),
      ),
      items: data.map((e) => MultiSelectItem<T>(e, e.toString()))
          .toList(),
      onConfirm: onConfirm,

      initialValue: selectedItems,
      buttonIcon: Icon(Icons.arrow_drop_down,size: 25,color: MyColors.black,),
      confirmText: Text("تآكيد",style: CustomInputTextStyle(lang: lang,textColor: MyColors.primary),),
      cancelText: Text("الغاء",style: CustomInputTextStyle(lang: lang,textColor: MyColors.primary),),
      chipDisplay: MultiSelectChipDisplay(
        alignment: lang=="ar"? Alignment.topRight : Alignment.topLeft ,
        onTap: onItemClick,
      ),
      validator: (values) {
        if (values == null || values.isEmpty) {
          return tr(context,"fillField");
        }
        return null;
      },
    );
  }

}


