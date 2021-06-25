import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

enum ListViewType { normal, api, separated }

typedef GenericBuilder = Widget Function(
    BuildContext context, int index, dynamic item);

class GenericListView<T> extends StatelessWidget {
  final dynamic onRefresh;
  final ListViewType type;
  final GenericBloc<List<T>>? cubit;
  final GenericBuilder? itemBuilder;
  final List<dynamic>? params;
  final List<Widget> children;
  final Color? dividerColor;
  final String? emptyStr;
  final Color? refreshBg;
  final Color? loadingColor;
  final EdgeInsets padding;

  const GenericListView({
    this.onRefresh,
    this.type = ListViewType.normal,
    this.cubit,
    this.itemBuilder,
    this.params,
    this.children = const [],
    this.dividerColor,
    this.emptyStr,
    this.refreshBg,
    this.padding = EdgeInsets.zero,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ListViewType.normal:
        return _NormalListView(children: children, padding: padding);
      case ListViewType.separated:
        return _SeparatedListView(
          onRefresh: onRefresh!,
          cubit: cubit!,
          itemBuilder: itemBuilder!,
          params: params,
          dividerColor: dividerColor,
          emptyStr: emptyStr,
          refreshBg: refreshBg,
          padding: padding,
        );
      case ListViewType.api:
        return _ApiListView(
          onRefresh: onRefresh!,
          cubit: cubit!,
          itemBuilder: itemBuilder!,
          params: params,
          emptyStr: emptyStr,
          refreshBg: refreshBg,
          padding: padding,
        );
    }
  }
}

class _NormalListView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;

  const _NormalListView({required this.children, required this.padding});

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ListView(
        padding: padding,
        children: children,
      ),
    );
  }
}

class _SeparatedListView<T> extends StatefulWidget {
  final dynamic onRefresh;
  final List<dynamic>? params;
  final GenericBloc<List<T>> cubit;
  final GenericBuilder itemBuilder;
  final Color? dividerColor;
  final String? emptyStr;
  final Color? refreshBg;
  final Color? loadingColor;
  final EdgeInsets padding;

  const _SeparatedListView(
      {required this.onRefresh,
        this.params,
        required this.cubit,
        required this.itemBuilder,
        this.dividerColor,
        this.emptyStr,
        this.refreshBg,
        required this.padding,
        this.loadingColor});

  @override
  _SeparatedListViewState createState() => _SeparatedListViewState<T>();
}

class _SeparatedListViewState<T> extends State<_SeparatedListView> {
  @override
  void initState() {
    Function.apply(widget.onRefresh, widget.params, {#refresh: false});
    Function.apply(widget.onRefresh, widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<T>>, GenericState<List<T>>>(
      bloc: widget.cubit as GenericBloc<List<T>>,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.length > 0) {
            return LiquidPullToRefresh(
              onRefresh: () => Function.apply(widget.onRefresh, widget.params),
              backgroundColor: MyColors.white,
              color: widget.refreshBg ?? Colors.blueAccent,
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 500,
              child: CupertinoScrollbar(
                child: ListView.separated(
                  itemCount: state.data.length,
                  padding: widget.padding,
                  itemBuilder: (context, index) {
                    return widget.itemBuilder(
                        context, index, state.data[index]);
                  },
                  separatorBuilder: (_, index) {
                    return Divider(
                      color: widget.dividerColor ?? MyColors.greyWhite,
                    );
                  },
                ),
              ),
            );
          }
          return Center(
            child: MyText(
                title: widget.emptyStr ?? "لايوجد بيانات",
                color: MyColors.black,
                size: 12),
          );
        }
        return LoadingDialog.showLoadingView(color: widget.loadingColor);
      },
    );
  }
}

class _ApiListView<T> extends StatefulWidget {
  final dynamic onRefresh;
  final List<dynamic>? params;
  final GenericBloc<List<T>> cubit;
  final GenericBuilder itemBuilder;
  final String? emptyStr;
  final Color? refreshBg;
  final Color? loadingColor;
  final EdgeInsets padding;

  const _ApiListView(
      {required this.onRefresh,
        this.params,
        required this.cubit,
        required this.itemBuilder,
        this.emptyStr,
        this.refreshBg,
        required this.padding,
        this.loadingColor});

  @override
  _ApiListViewState createState() => _ApiListViewState<T>();
}

class _ApiListViewState<T> extends State<_ApiListView> {
  @override
  void initState() {
    Function.apply(widget.onRefresh, widget.params, {#refresh: false});
    Function.apply(widget.onRefresh, widget.params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<T>>, GenericState<List<T>>>(
      bloc: widget.cubit as GenericBloc<List<T>>,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.length > 0) {
            return LiquidPullToRefresh(
              onRefresh: () => Function.apply(widget.onRefresh, widget.params),
              backgroundColor: MyColors.white,
              color: widget.refreshBg ?? Colors.blueAccent,
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 500,
              child: CupertinoScrollbar(
                child: ListView.builder(
                  itemCount: state.data.length,
                  padding: widget.padding,
                  itemBuilder: (context, index) {
                    return widget.itemBuilder(
                        context, index, state.data[index]);
                  },
                ),
              ),
            );
          }
          return Center(
            child: MyText(
                title: widget.emptyStr ?? "لايوجد بيانات",
                color: MyColors.black,
                size: 12),
          );
        }
        return LoadingDialog.showLoadingView(color: widget.loadingColor);
      },
    );
  }
}
