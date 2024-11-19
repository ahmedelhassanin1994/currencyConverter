
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_historical/historical_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalScreen extends StatefulWidget {

  const HistoricalScreen();

  @override
  _HistoricalScreen createState() => _HistoricalScreen();
}


class _HistoricalScreen extends State<HistoricalScreen> {


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

    return  Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation:AppelEvation.E0,
        automaticallyImplyLeading:true,
        backgroundColor: ColorManager.white,
        title:Text(
          AppStrings.historical,
          style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
        ),
      ),
      body: SafeArea(

          child: Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            color: ColorManager.white,

              child:        BlocBuilder<SelectCountryCubit, CountrySelectionState>(
                  builder: (context, state) {
                    BlocProvider.of<HistoricalCubit>(context).getHistorical(state.selectedFromCountry, state.selectedToCountry);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                      BlocBuilder<HistoricalCubit, HistoricalState>(
                         builder: (context, stateHistorical) {
                            if(stateHistorical is HistoricalLoading){
                              return Container(
                                  margin: EdgeInsets.only(top: AppMargin.m8.h),
                                  child: Center(child: CircularProgressIndicator()));
                            }
                         else if(stateHistorical is HistoricalLoaaded){
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
                                              "${AppStrings.Date} : ",
                                              style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                                          ),
                                          SizedBox(
                                            width: AppSize.s2.w,
                                          ),
                                          Text(
                                              "${stateHistorical.historical.date}",
                                              style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: AppSize.s1.h,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text(
                                            "${stateHistorical.historical.base} : ",
                                            style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp)
                                        ),
                                        SizedBox(
                                          width: AppSize.s2.w,
                                        ),
                                        Text(
                                            "${stateHistorical.historical.results?.values.first}",
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
