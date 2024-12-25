import 'package:core_data/src/core/constant.dart';
import 'package:core_data/src/data/responeses/response_convert.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_currencyConverter.g.dart';

@RestApi()
abstract class ApiCurrencyConverter {
  factory ApiCurrencyConverter(Dio dio, {String baseUrl}) =
      _ApiCurrencyConverter;

  @GET("convert")
  Future<ResponseConvert> Convert(@Query('from') String from,
      @Query('to') String to, @Query('amount') String amount,
      {@Query('api_key') String api_key = ''});

  @GET("historical")
  Future<Responsehistorical> getHistorical(@Query('from') String from,
      @Query('to') String to, @Query('date') String date,
      {@Query('api_key') String api_key = ''});
}
