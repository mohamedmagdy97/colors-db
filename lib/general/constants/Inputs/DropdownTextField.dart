import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/CustomInputDecoration.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomInputTextStyle.dart';
import 'custom_dropDown/CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final dynamic validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? downIconPadding;
  final bool useName;

  DropdownTextField(
      {this.label,
        this.hint,
        this.margin,
        this.validate,
        this.downIconPadding,
        this.useName = true,
        this.onChange,
        this.fontSize,
        this.labelSize,
        this.finData,
        this.dropKey,
        this.data,
        this.selectedItem,
        this.showSelectedItem = false});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: true,
        maxHeight: 300,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style: CustomInputTextStyle(lang: lang),
        searchBoxDecoration: CustomInputDecoration(
            lang: lang,
            hint: "search",
            enableColor: Colors.black,
            focusColor: MyColors.primary,
            borderRaduis: 5,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)
        ),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: MyText(
              title: widget.label!=null?widget.label!:widget.hint!,
              size: 16,
              color: MyColors.white,
            ),
          ),
        ),
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        dropdownSearchDecoration: CustomInputDecoration(
            lang: lang,
            hint: widget.hint,
            enableColor: Colors.black,
            focusColor: MyColors.primary,
            borderRaduis: 2,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17)
        ),
      ),
    );
  }
}
