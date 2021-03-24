import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/Inputs/RichTextFiled.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/resources/GeneralRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/res.dart';


class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  GlobalKey<ScaffoldState> _scaffold=new GlobalKey();
  GlobalKey<FormState> _formKey=new GlobalKey();
  TextEditingController _name=new TextEditingController();
  TextEditingController _mail=new TextEditingController();
  TextEditingController _msg=new TextEditingController();
  GeneralRepository _repository;


  @override
  void initState() {
    super.initState();

  }

  _sendMessage(){
    if(_formKey.currentState.validate()){
      _repository.sendMessage(_name.text, _mail.text, _msg.text).then((value) {
        _name.text="";
        _mail.text="";
        _msg.text="";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "تواصل معنا",
        con: context,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded,size: 25,color: MyColors.secondary,),
          onPressed: (){},
        ),
      ),
      backgroundColor: MyColors.primary,
      key: _scaffold,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: MyColors.greyWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Res.logo),
                        fit: BoxFit.fill
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: MyColors.primary,width: 1)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LabelTextField(
                        label: "الأسم",
                        type: TextInputType.text,
                        controller: _name,
                        validate: (value)=>value.validateEmpty(),
                      ),
                      LabelTextField(
                        label: "mail", //"البريد",
                        type: TextInputType.emailAddress,
                        controller: _mail,
                        validate: (value)=>value.validateEmail(),

                      ),
                      RichTextFiled(
                        label: "message", //"الرسالة",
                        type: TextInputType.emailAddress,
                        height: 100,
                        max: 8,
                        min: 6,
                        controller: _msg,
                        validate: (value)=>value.validateEmpty(),
                      ),

                      DefaultButton(
                        title: "send",//"ارسال",
                        onTap: _sendMessage,
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(bottom: 30,),
                      //   child: Wrap(
                      //     spacing: 25,
                      //     runSpacing: 15,
                      //     alignment: WrapAlignment.center,
                      //     children: [
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.instgram,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.instagram,size: 30,color: MyColors.grey,),
                      //       ),
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.facebook,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.facebookF,size: 30,color: MyColors.grey,),
                      //       ),
                      //       InkWell(
                      //         onTap: ()=>Utils.launchURL(url: setting.twitter,scaffold: _scaffold),
                      //         child: Icon(FontAwesomeIcons.twitter,size: 30,color: MyColors.grey,),
                      //       ),
                      //     ],
                      //   ),
                      // )

                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
