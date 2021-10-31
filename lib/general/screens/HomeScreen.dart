import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/catgory_model.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/res.dart';
import 'package:dio_helper/dio_helper/DioImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tf_custom_widgets/Inputs/MultiDropDownField.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GenericBloc<List<Category>> subCatsCubit = GenericBloc([]);

  onSubCategoryChanged(List<Category>? lst){
    subCatsCubit.onUpdateData(lst??[]);
  }

  Future<List<Category>> fetchCatsData(bool? refresh)async{
    final data = await DioHelper(forceRefresh: refresh??true, context: context).get(url: 'HomeService?lang=ar');
    final cats = List<Category>.from(data["data"]["categories"].map((e) => Category.fromJson(e)));
    return cats;
  }

  @override
  void initState() {
    subCatsCubit.onUpdateData([Category(id: 2, name: 'البنوك والمكاتب')]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "title"),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Center(
            child: Lottie.asset(
              Res.delivery,
              // width: 300,
              // height: 300,
              repeat: true,
            ),
          ),
          BlocBuilder<GenericBloc<List<Category>>,
              GenericState<List<Category>>>(
            bloc: subCatsCubit,
            builder: (context, state) {
              return MultiDropDownField<Category>(
                dropkey: GlobalKey(),
                label: "Select property category",
                title: "Select property category",
                onConfirm: onSubCategoryChanged,
                onFind: () async => await fetchCatsData(false),
                onItemClick: (Category model) {},
                fillColor: Colors.transparent,
                borderColor: MyColors.greyWhite,
                chipColor: MyColors.primary,
                selectedItems: state.data,
              );
            },
          ),
        ],
      ),
    );
  }
}
