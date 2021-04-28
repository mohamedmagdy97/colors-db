import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';

class CustomModal extends StatelessWidget {

  final Widget content;
  final String title;

  const CustomModal({Key? key,required this.content,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            leading: Container(), middle: MyText(title: title,size: 12,color: MyColors.black,),
          trailing: IconButton(
            icon: Icon(Icons.close,size: 25,color: Colors.black,),
            onPressed: ()=>Navigator.of(context).pop(),
          ),
          backgroundColor: MyColors.primary,
        ),
        child: SafeArea(
          bottom: false,
          child: content,
        ),
      ),
    );
  }
}