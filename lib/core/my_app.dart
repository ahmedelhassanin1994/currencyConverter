import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/theme_manager.dart';
import 'package:mvvm_project/core/resources/router/app_router.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
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

  ReposCubit reposCubit= instance<ReposCubit>();
  SelectCountryCubit selectCountryCubit= instance<SelectCountryCubit>();

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

           BlocProvider<ReposCubit>(
               create: (BuildContext context) =>reposCubit
           ),
           BlocProvider<SelectCountryCubit>(
               create: (BuildContext context) =>selectCountryCubit
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
