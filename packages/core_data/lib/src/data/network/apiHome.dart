import 'package:core_data/src/core/constant.dart';
import 'package:core_data/src/data/responeses/model_country.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'apiHome.g.dart';

@RestApi()
abstract class ApiHome {
  factory ApiHome(Dio dio, {String baseUrl}) = _ApiHome;
  @GET("v3.1/all")
  Future<List<ModelCountry>> getcountrys();
}
