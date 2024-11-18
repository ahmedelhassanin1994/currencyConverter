
import 'package:dio/dio.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_commits.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'apiHome.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiHome {
  factory ApiHome(Dio dio, {String baseUrl}) = _ApiHome;


  @GET("v3.1/all")
  Future<List<ModelCountry>> getcountrys();

  @GET("repos/mralexgray/{name}/commits")
  Future<List<ModelCommits>> getCommits(@Path() String name,{@Query('per_page') String per_page="3",});
}
