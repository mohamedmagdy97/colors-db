part of 'TermsImports.dart';


class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> with TermsData {

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'الشروط والاحكام'),
      body: BlocBuilder<GenericBloc<String>,GenericState<String>>(
        bloc: termsCubit,
        builder: (_,state){
          if(state is GenericUpdateState){
            return BuildTermsView(text: state.data);
          }else{
            return LoadingDialog.showLoadingView();
          }
        },
      ),
    );

  }
}
