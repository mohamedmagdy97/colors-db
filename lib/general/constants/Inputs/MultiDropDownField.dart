import 'dart:async';

import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../MyColors.dart';
import 'text_field_style/CustomInputTextStyle.dart';


class MultiDropDownField<T> extends StatefulWidget {
  final List<T>? data;
  final List<T> selectedItems;
  final String title;
  final String label;
  final Function(List<T>) onConfirm;
  final Function(T) onItemClick;
  final Future<List<T>> Function()? onFind;

  const MultiDropDownField({
    this.data,
    required this.selectedItems,
    required this.title,
    required this.label,
    required this.onConfirm,
    required this.onItemClick,
    this.onFind,
  });
  @override
  _MultiDropDownFieldState createState() => _MultiDropDownFieldState();
}

class _MultiDropDownFieldState<T> extends State<MultiDropDownField<T>>{

  final StreamController<List<T>> _itemsStream = StreamController<List<T>>();
  late List<T> items;


  @override
  void initState() {
    items=widget.data??[];
    if (widget.onFind!=null) {
      setItemsToStream();
    }else{
      _itemsStream.add(items);
    }
    super.initState();
  }

  setItemsToStream()async{
    var data = await widget.onFind!.call();
    _itemsStream.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return  StreamBuilder<List<T>>(
      stream: _itemsStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData&&snapshot.data!=null) {
          return MultiSelectBottomSheetField<T>(
            initialChildSize: 0.5,
            listType: MultiSelectListType.LIST,
            searchable: true,
            buttonText: Text(widget.label,style: CustomInputTextStyle(lang: lang,textColor: MyColors.blackOpacity),),
            title: MyText(title: widget.title, color: MyColors.black, size: 12),
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            items: snapshot.data!.map((e) => MultiSelectItem<T>(e, e.toString())).toList(),
            onConfirm: widget.onConfirm,
            initialValue: widget.selectedItems,
            buttonIcon: Icon(Icons.arrow_drop_down,size: 25,color: MyColors.black,),
            confirmText: Text("تآكيد",style: CustomInputTextStyle(lang: lang,textColor: MyColors.primary),),
            cancelText: Text("الغاء",style: CustomInputTextStyle(lang: lang,textColor: MyColors.primary),),
            chipDisplay: MultiSelectChipDisplay(
              alignment: lang=="ar"? Alignment.topRight : Alignment.topLeft ,
              onTap: widget.onItemClick,
            ),
            validator: (values) {
              if (values == null || values.isEmpty) {
                return tr(context,"fillField");
              }
              return null;
            },
          );
        }
        return Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CupertinoActivityIndicator(),
        );

      }
    );
  }
}




