
import 'dart:convert';

import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/network/api_currencyConverter.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
abstract class RemoteDataSourceHome {


   Future<List<ModelCountry>> getcountrys();
   Future<ResponseConvert> Convert( String from, String to, String amount);
   Future<Responsehistorical> getHistorical( String from, String to, String date);


}

 class RemoteDataSourceHomeImplementer implements RemoteDataSourceHome {
  final ApiHome _appServiceClient;
  final ApiCurrencyConverter _apiCurrencyConverter;

  RemoteDataSourceHomeImplementer(this._appServiceClient,this._apiCurrencyConverter);

  @override
  Future<List<ModelCountry>> getcountrys() async{
    return await _appServiceClient.getcountrys();
  }

  @override
  Future<ResponseConvert> Convert(String from, String to, String amount) async{
    // TODO: implement Convert
    return await _apiCurrencyConverter.Convert(from, to, amount);
  }

  @override
  Future<Responsehistorical> getHistorical(String from, String to, String date) async{
    // TODO: implement getHistorical
    return await _apiCurrencyConverter.getHistorical(from, to, date);
  }


}
