import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/CustomInputDecoration.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomInputTextStyle.dart';
import 'custom_dropDown/CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {

  final List<DataType> data;
  final GlobalKey dropKey;
  final String label;
  final DataType selectedItem;
  final bool showSelectedItem;
  final EdgeInsets margin;
  final double fontSize;
  final double labelSize;
  final dynamic  validate;
  final dynamic onChange;
  final Function(String value) finData;
  final EdgeInsets downIconPadding;
  final bool useName;

   DropdownTextField({this.label,this.margin,this.validate,this.downIconPadding,this.useName= true,
    this.onChange,this.fontSize,this.labelSize, this.finData,this.dropKey,this.data,
    this.selectedItem,this.showSelectedItem=false});
  @override
  _DropdownTextFieldState<DataType> createState() => _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return  Container(
      margin: widget.margin?? EdgeInsets.symmetric(vertical: 10),
      child: CustomDropDown<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: true,
        iconPadding: widget.downIconPadding,
        maxHeight: 300,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData ,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName? u.name:u,
        showSelectedItem: widget.showSelectedItem,
        searchBoxDecoration: CustomInputDecoration(lang: lang,label:"بحث"),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: MyText(title: widget.label,size: 16,color: MyColors.white,),
          ),
        ),
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        dropdownSearchDecoration:  CustomInputDecoration(lang: lang,label:widget.label),
        // hintStyle: GoogleFonts.cairo(fontSize: 14,),
        // labelStyle: GoogleFonts.roboto(fontSize: 18),
        inputStyle: CustomInputTextStyle(lang: lang),

    ),
    );
  }

}


