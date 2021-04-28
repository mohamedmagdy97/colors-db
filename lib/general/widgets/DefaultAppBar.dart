import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';

class DefaultAppBar extends PreferredSize {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final Size preferredSize ;

  DefaultAppBar({
    required this.title,
    this.actions = const [],
    this.leading,
    this.preferredSize = const Size.fromHeight(kToolbarHeight + 5),
  }) : super(child: Container(),preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
        title: "$title",
        size: 12,
        color: MyColors.white,
      ),
      centerTitle: false,
      backgroundColor: MyColors.primary,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      actions: actions,
    );
  }
}
