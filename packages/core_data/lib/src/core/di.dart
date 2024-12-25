import 'package:core_data/src/core/app_prefs.dart';
import 'package:core_data/src/core/common/network/dio_factory.dart';
import 'package:core_data/src/core/common/network/network_info.dart';
import 'package:core_data/src/data/data_source/local_data_source.dart';
import 'package:core_data/src/data/data_source/remote_data_source_home.dart';
import 'package:core_data/src/data/network/apiHome.dart';
import 'package:core_data/src/data/network/api_currencyConverter.dart';
import 'package:core_data/src/data/repository/repositoryHome_impl.dart';
import 'package:core_data/src/domain/repository/repository_home.dart';
import 'package:core_data/src/domain/usecase/convert_usecase.dart';
import 'package:core_data/src/domain/usecase/country_usecase.dart';
import 'package:core_data/src/domain/usecase/historical_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  instance.registerLazySingleton<ApiCurrencyConverter>(
      () => ApiCurrencyConverter(dio));

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton(() => AppPreferences(instance()));

  instance.registerLazySingleton<RemoteDataSourceHome>(
      () => RemoteDataSourceHomeImplementer(instance(), instance()));

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
    instance.registerFactory<HistoricalUseCase>(
        () => HistoricalUseCase(instance()));
  }
}

restetAllModule() {
  instance.reset(dispose: true);
  initAppModule();
}
