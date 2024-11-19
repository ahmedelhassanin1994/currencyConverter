import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/theme_manager.dart';
import 'package:mvvm_project/core/resources/router/app_router.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_historical/historical_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  CountryCubit countryCubit= instance<CountryCubit>();
  SelectCountryCubit selectCountryCubit= instance<SelectCountryCubit>();
  ConvertCubit convertCubit= instance<ConvertCubit>();
  HistoricalCubit historicalCubit= instance<HistoricalCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    selectCountryCubit.getLastCurrency();

    // TODO: implement build
    return ResponsiveSizer(builder: (context, orientation, deviceType) {

       return  MultiBlocProvider(
         providers: [

           BlocProvider<CountryCubit>(
               create: (BuildContext context) =>countryCubit
           ),
           BlocProvider<SelectCountryCubit>(
               create: (BuildContext context) =>selectCountryCubit
           ),
           BlocProvider<ConvertCubit>(
               create: (BuildContext context) =>convertCubit
           ),
           BlocProvider<HistoricalCubit>(
               create: (BuildContext context) =>historicalCubit
           ),
         ],
         child:   MaterialApp(
           onGenerateRoute: RouteGenerator.getRoute,
           debugShowCheckedModeBanner: false,
           initialRoute: Routes.all_routs,
           theme: getApplicationTheme(),


       ));

    });
  }
}
