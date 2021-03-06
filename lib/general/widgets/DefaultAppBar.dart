import 'package:flutter/material.dart';
import 'package:colors_db/general/constants/MyColors.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size;

  DefaultAppBar(
      {required this.title, this.actions = const [], this.leading, this.size});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: MyText(
        title: "$title",
        size: 16,
        color: MyColors.primary,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
