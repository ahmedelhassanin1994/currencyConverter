import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';


abstract class RepositoryHome {

   Future<Either<Failure,List<ModelCountry>>> getcountrys();
   Future<Either<Failure,ResponseConvert>> Convert( String from, String to, String amount);
   Future<Either<Failure,Responsehistorical>> getHistorical( String from, String to, String date);

}
