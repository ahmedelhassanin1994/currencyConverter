import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_historical/historical_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_data/core_data.dart';


final instance = GetIt.instance;

Future<void> initAppModuleApp() async {

  await initAppModule();
  // //Infrastructure
  // instance.registerLazySingleton<Dio>(() => Dio());

  HomeModule();
  instance.registerFactory<CountryCubit>(() => CountryCubit(instance()));
  instance.registerFactory<SelectCountryCubit>(() => SelectCountryCubit(instance()));
  instance.registerFactory<ConvertCubit>(() => ConvertCubit(instance()));
  instance.registerFactory<HistoricalCubit>(() => HistoricalCubit(instance()));
}






restetAllModule() {
  instance.reset(dispose: true);
  initAppModule();
}

