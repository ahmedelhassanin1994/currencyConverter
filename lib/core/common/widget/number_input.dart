
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
class NumberInput extends StatelessWidget{

  final  textEditingController;
  final onSaved;
  final onChanged;
  final labelText;
  final hintText;
  final hintStyle;
  final borderRadius;
  final prefixIcon;
  final errorStyle;
  final style;
  final contentPadding;


  NumberInput({Key? key, required this.textEditingController,required this.onSaved,required this.onChanged,required this.labelText,required this.hintText,required this.hintStyle,required this.borderRadius,required this.prefixIcon,required this.errorStyle,this.style, this.contentPadding}) : super(key: key);

  bool isPhone(String em) {

    String p = r'^[0-9]+$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  Widget getContentWidget(BuildContext context) {

    return Container(

      child: TextFormField(

        controller: textEditingController,
        keyboardType: TextInputType.emailAddress,

        style: style,

        onSaved:onSaved,
        onChanged:onChanged ,
        maxLines: 1,
        maxLength: 13,
        textAlign: TextAlign.center,
        validator: (input) => !isPhone(input!)? "" :
        input.length<1 ? "${AppStrings.plz_enter_input}" : null,
        decoration: InputDecoration(
          filled: true,
          contentPadding: contentPadding,
          counter: Offstage(),

          // prefixIcon: widget.icon,
          fillColor: ColorManager.primary.withOpacity(.1),

          errorStyle: errorStyle,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.grey3),
            borderRadius: borderRadius,
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.grey3),
            borderRadius:borderRadius,
          ),
          prefixIcon: prefixIcon,

          hintText: "$hintText",
          hintStyle: hintStyle,


          // labelText: '$labelText',
        ),

        // ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return getContentWidget(context);
  }
}