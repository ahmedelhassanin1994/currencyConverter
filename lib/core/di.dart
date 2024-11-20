import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/network/dio_factory.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/network/api_currencyConverter.dart';
import 'package:mvvm_project/features/features_home/data/repository/repositoryHome_impl.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/historical_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_historical/historical_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // networl instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiHome>(() => ApiHome(dio));
  instance.registerLazySingleton<ApiCurrencyConverter>(() => ApiCurrencyConverter(dio));

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton(() => AppPreferences(instance()));



  instance.registerLazySingleton<RemoteDataSourceHome>(
      () => RemoteDataSourceHomeImplementer(instance(),instance()));



  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer());



  // repository

  instance.registerLazySingleton<RepositoryHome>(
      () => RepositoryHomeImpl(instance(), instance(), instance()));




  //Infrastructure
  instance.registerLazySingleton<Dio>(() => Dio());

  HomeModule();

}

HomeModule() {
  if (!GetIt.I.isRegistered<CountryUseCase>()) {
    instance.registerFactory<CountryUseCase>(() => CountryUseCase(instance()));
    instance.registerFactory<ConvertUseCase>(() => ConvertUseCase(instance()));
    instance.registerFactory<HistoricalUseCase>(() => HistoricalUseCase(instance()));
    instance.registerFactory<CountryCubit>(() => CountryCubit(instance()));
    instance.registerFactory<SelectCountryCubit>(() => SelectCountryCubit(instance()));
    instance.registerFactory<ConvertCubit>(() => ConvertCubit(instance()));
    instance.registerFactory<HistoricalCubit>(() => HistoricalCubit(instance()));
  }
}





restetAllModule() {
  instance.reset(dispose: true);
  initAppModule();
}

