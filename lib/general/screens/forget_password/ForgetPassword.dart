part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>  with ForgetPasswordData {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      body: BlocBuilder<ForgetPasswordCubit,ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        builder: (context,state){
          return IgnorePointer(
            ignoring: state.showLoading,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                children: <Widget>[

                  HeaderLogo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText(
                        title:("forgetPassword"),
                        size: 12,
                        color: MyColors.black,
                        alien: TextAlign.center,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,size: 25,color: MyColors.primary,),
                        onPressed: ()=> Navigator.of(context).pop(),
                      )
                    ],
                  ),
                  _buildFormInputs(),
                  _buildConfirmButton(state.showLoading),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildFormInputs(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Form(
        key: formKey,
        child: LabelTextField(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          type: TextInputType.number,
          label: ("phone"),
          isPassword: false,
          controller: phone,
          action: TextInputAction.done,
          onSubmit: ()=>setForgetPassword(context),
          validate: (value)=> value.validatePhone(),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(bool showLoading){
    return Visibility(
      child: InkWell(
        onTap: ()=>setForgetPassword(context),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: MyText(
            title: "${("send")}",
            size: 12,
            color: Colors.white,
          ),
        ),
      ),
      visible: !showLoading,
      replacement: SpinKitDualRing(
        color: MyColors.primary,
        size: 30.0,
      ),
    );
  }

}
