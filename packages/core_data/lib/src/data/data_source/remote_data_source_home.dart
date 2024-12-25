import 'package:core_data/src/core/constant.dart';
import 'package:core_data/src/data/network/apiHome.dart';
import 'package:core_data/src/data/network/api_currencyConverter.dart';
import 'package:core_data/src/data/responeses/model_country.dart';
import 'package:core_data/src/data/responeses/response_convert.dart';
import 'package:core_package/AppConfig.dart';

abstract class RemoteDataSourceHome {
  Future<List<ModelCountry>> getcountrys();
  Future<ResponseConvert> Convert(String from, String to, String amount);
  Future<Responsehistorical> getHistorical(String from, String to, String date);
}

class RemoteDataSourceHomeImplementer implements RemoteDataSourceHome {
  final ApiHome _appServiceClient;
  final ApiCurrencyConverter _apiCurrencyConverter;

  RemoteDataSourceHomeImplementer(
      this._appServiceClient, this._apiCurrencyConverter);

  @override
  Future<List<ModelCountry>> getcountrys() async {
    return await _appServiceClient.getcountrys();
  }

  @override
  Future<ResponseConvert> Convert(String from, String to, String amount) async {
    // TODO: implement Convert
    return await _apiCurrencyConverter.Convert(from, to, amount,api_key: AppConfig.apiKey);
  }

  @override
  Future<Responsehistorical> getHistorical(
      String from, String to, String date) async {
    // TODO: implement getHistorical
    return await _apiCurrencyConverter.getHistorical(from, to, date,api_key:AppConfig.apiKey);
  }
}
