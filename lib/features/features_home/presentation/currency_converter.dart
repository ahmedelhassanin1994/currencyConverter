
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/common/widget/number_input.dart';
import 'package:mvvm_project/core/common/widget/searchBox.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/country_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Currency_Converter extends StatefulWidget {

  const Currency_Converter();

  @override
  _Currency_Converter createState() => _Currency_Converter();
}


class _Currency_Converter extends State<Currency_Converter> {

  TextEditingController textEditingController_from = new TextEditingController();
  TextEditingController textEditingController_to = new TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  Widget getContentWidget(){
   BlocProvider.of<CountryCubit>(context).get_getcountrys();

    return  Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation:AppelEvation.E0,
        automaticallyImplyLeading:true,
        backgroundColor: ColorManager.primary,
        title:Text(
          AppStrings.convert_currencies,
          style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s16.sp),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Routes.historical);

          }, icon: Icon(Icons.date_range,color: ColorManager.white,))
        ],
      ),
      body: SafeArea(

          child: Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            color: ColorManager.white,

              child:        BlocBuilder<SelectCountryCubit, CountrySelectionState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m4.h),
                          child: Text(
                            AppStrings.convertcurrencies_body,
                            style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                          ),
                        ),
                        Container(
                          width: AppSize.s100.w,
                          margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m8.w,right: AppMargin.m8.w),
                          child: NumberInput(
                              style: Theme.of(context).textTheme.headlineSmall,
                              hintStyle:getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s15.sp),
                              borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2.w)),
                              onChanged: (val) {
                                BlocProvider.of<SelectCountryCubit>(context).setAmount(val);
                              },
                              onSaved: (val) {

                              },
                              labelText: '',
                              hintText:  "0",
                              textEditingController: textEditingController_from,
                              prefixIcon: null,
                              errorStyle: null,
                            ),
                        ),
                        Container(
                          width: AppSize.s100.w,
                          margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m12.w,right: AppMargin.m12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  BlocProvider.of<SelectCountryCubit>(context).updateSelectedType(CurrencyInputType.from);
                                  Navigator.pushNamed(context, Routes.CountrysScreen);
                                },
                                child:  Container(
                                  child: Text(
                                    '${state.selectedFromCountry}',
                                    style:getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                                  ),

                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.swap_horiz_outlined,
                                  size: AppSize.s5.w,
                                ),
                              ),
                              InkWell(
                               onTap: (){
                                 BlocProvider.of<SelectCountryCubit>(context).updateSelectedType(CurrencyInputType.to);
                                 Navigator.pushNamed(context, Routes.CountrysScreen);
                               },
                               child:  Container(
                                 child: Text(
                                   '${state.selectedToCountry}',
                                   style:getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                                 ),

                               ),
                             ),

                            ],
                          ),
                        ),

                      BlocBuilder<ConvertCubit, ConvertState>(
                         builder: (context, stateConvert) {
                           if(stateConvert is ConvertLoading){
                             return Container(
                                 margin: EdgeInsets.only(top: AppMargin.m8.h),
                                 child: Center(child: CircularProgressIndicator()));
                           }else{
                             return CustomButton(
                               onTab: (){
                                 BlocProvider.of<ConvertCubit>(context).Convert(state.selectedFromCountry, state.selectedToCountry, state.amount);

                               },
                               padding: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w,top: AppMargin.m2.h,bottom: AppMargin.m2.h),
                               margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w,top: AppMargin.m8.h),
                               decoration:  BoxDecoration(
                                   color: ColorManager.primary,
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(AppRadius.r3.w),
                                   )),
                               text:AppStrings.convert_currencies,
                               style: Theme.of(context).textTheme.titleMedium,
                             );
                           }

                        },

                        ),

                      BlocBuilder<ConvertCubit, ConvertState>(
                         builder: (context, stateConvert) {
                          if(stateConvert is ConvertLoaaded){
                            return Container(
                              width: AppSize.s100.w,
                              margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m4.h,),
                                    child: Text(
                                      "${AppStrings.result} : ",
                                        style:getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)

                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSize.s1.h,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                            "${stateConvert.convert.currencyName} : ",
                                            style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                                        ),
                                        SizedBox(
                                          width: AppSize.s2.w,
                                        ),
                                        Text(
                                            "${stateConvert.convert.result?.currencies.values.first}",
                                            style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            );
                          }else{
                            return Container();
                          }

                    })
                      ],
                    );
                  }

              ),
            ),
          )

    );
  }



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(),
      tablet: getContentWidget(),
      mobile: getContentWidget(),
    );
  }
}
