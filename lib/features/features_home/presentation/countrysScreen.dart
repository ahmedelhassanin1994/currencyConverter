import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_project/core/common/widget/searchBox.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/country_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_data/core_data.dart';


@RoutePage()
class CountrysScreen extends StatefulWidget {

 const CountrysScreen();

  @override
  _CountrysScreen createState() => _CountrysScreen();
}


class _CountrysScreen extends State<CountrysScreen> {




   @override
  void initState() {
    // TODO: implement initState
     super.initState();
  }


   @override
   void dispose() {
     super.dispose();
   }




String getCurrency(String countryCode) {
   var format = NumberFormat.currency(name: '$countryCode');
   return format.currencyName.toString();
  }
Widget getContentWidget(){

  final bloc = BlocProvider.of<CountryCubit>(context);
  return  Scaffold(
           backgroundColor: ColorManager.white,
           body: SafeArea(

             child: Container(
               width: AppSize.s100.w,
               height: AppSize.s100.h,
               color: ColorManager.white,

               child: RefreshIndicator(
                   onRefresh: ()async {
                     bloc.get_getcountrys();
                   },
                   child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                   Padding(
                   padding: EdgeInsets.only(
                   bottom: AppSize.s1.h,
                       top: AppSize.s1.h,
                       left: AppPading.p1.w,
                       right: AppPading.p1.w),
                 child: SearchBox(
                   prefixIcon:  Icon(CupertinoIcons.search,size: AppSize.s5.w,),
                   suffixIcon:  Icon(CupertinoIcons.xmark_circle_fill,size: AppSize.s5.w),
                   width: AppSize.s100.w,
                   backgroundColor: ColorManager.select.withOpacity(.4),
                   showCancelButton: false,
                   onChanged: (val) {
                     BlocProvider.of<CountryCubit>(context).search_getcountrys(val);
                   },
                 )),

                           Expanded(child:
                           BlocBuilder<CountryCubit, CountryState>(
                             builder: (context, state) {
                               if (state is CountryLoading) {
                                 bloc.get_getcountrys();
                                 return Center(child: CircularProgressIndicator());
                               } else if (state is CountryLoaaded) {
                                 return ListView.builder(
                                     shrinkWrap: true,
                                     physics: ClampingScrollPhysics(),
                                     itemCount: bloc.allCountry.length,
                                     itemBuilder: (context, index) {
                                       final item = bloc.allCountry[index];
                                       return InkWell(
                                         onTap: (){
                                           BlocProvider.of<SelectCountryCubit>(context).updateSelectedCurrency(item.currencyName.toString());
                                           Navigator.pop(context);
                                         },
                                         child: CardCountry(item),
                                       );
                                     },

                                   );
                               }else if(state is SearchLoaaded){
                                 return ListView.builder(
                                   shrinkWrap: true,
                                   physics: ClampingScrollPhysics(),
                                   itemCount: bloc.searchCountry.length,
                                   itemBuilder: (context, index) {
                                     final item = bloc.searchCountry[index];
                                     return InkWell(
                                       onTap: (){
                                         BlocProvider.of<SelectCountryCubit>(context).updateSelectedCurrency(item.currencyName.toString());
                                         BlocProvider.of<CountryCubit>(context).closeSearch();
                                         Navigator.pop(context);

                                       },
                                       child: CardCountry(item),
                                     );
                                   },

                                 );
                               }
                               else if (state is CountryError) {


                                 return Center(child: Text(state.failure.message.toString()));
                               }
                               return Container(); // Empty container for initial state
                             },
                           ),),

                         ],
                       ),
                   ),
                   )
               ),


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
