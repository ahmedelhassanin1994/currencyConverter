import 'package:dio/dio.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_currencyConverter.g.dart';

@RestApi(baseUrl: Constant.baseUrl_providor,)
abstract class ApiCurrencyConverter {

  factory ApiCurrencyConverter(Dio dio, {String baseUrl}) = _ApiCurrencyConverter;

  @GET("convert")
  Future<ResponseConvert> Convert(@Query('from') String from,@Query('to') String to,@Query('amount') String amount,{@Query('api_key') String api_key=Constant.api_key});

  @GET("historical")
  Future<Responsehistorical> getHistorical(@Query('from') String from,@Query('to') String to,@Query('date') String date,{@Query('api_key') String api_key=Constant.api_key});

}
