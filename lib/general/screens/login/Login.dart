part of 'LoginImports.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with LoginData{




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: scaffold,
        backgroundColor: MyColors.white,
        body: BlocBuilder<LoginCubit,LoginState>(
          bloc: loginCubit,
          builder: (context,state){
            return IgnorePointer(
              ignoring: state.loading,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.only(bottom: 20),
                  children: <Widget>[

                    HeaderLogo(),

                    //form inputs
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MyText(
                                  title: tr(context,"login"),
                                  size: 16,
                                  color: MyColors.primary,
                                  alien: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                LabelTextField(
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  type: TextInputType.phone,
                                  label: "${("phone")}",
                                  isPassword: false,
                                  controller: phone,
                                  action: TextInputAction.next,
                                  validate: (value)=> value.validateEmpty(),

                                ),
                                LabelTextField(
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  type: TextInputType.text,
                                  label: "${("password")}",
                                  isPassword: true,
                                  controller: pass,
                                  action: TextInputAction.done,
                                  onSubmit: ()=> setUserLogin(context),
                                  validate: (value)=> value.validateEmpty(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            // onTap: () => ExtendedNavigator.of(context).push(Routes.forgetPassword),
                            child: MyText(
                              title: "${("forgetPassword")}",
                              size: 10,
                              color: MyColors.blackOpacity,
                              decoration: TextDecoration.underline,
                              alien: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),


                    //login button
                    Visibility(
                      child: DefaultButton(
                        title: ("login"), //"تسجيل دخول",
                        margin: EdgeInsets.all(30),
                        onTap: ()=>setUserLogin(context),
                      ),
                      visible: !state.loading,
                      replacement: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: SpinKitDualRing(
                          color: MyColors.primary,
                          size: 30.0,
                        ),
                      ),
                    ),

                    //visitor link
                    InkWell(
                      onTap: () => enterAsVisitor(context),
                      child: MyText(
                        title: "الدخول كزائر",
                        size: 10,
                        color: MyColors.black,
                        decoration: TextDecoration.underline,
                        alien: TextAlign.center,
                      ),
                    ),

                    //register text link
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: ("don'tHaveAccount"),
                            size: 12,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              // onTap: ()=>ExtendedNavigator.of(context).push(Routes.register),
                              child: MyText(
                                title: ("register"),
                                size: 12,
                                color: MyColors.primary,
                              )),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
      onWillPop: onBackPressed,
    );
  }


  @override
  void dispose() {
    pass.clear();
    phone.clear();
    loginCubit.close();
    super.dispose();
  }

}

