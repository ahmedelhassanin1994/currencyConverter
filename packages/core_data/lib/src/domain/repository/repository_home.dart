import 'package:core_data/src/core/common/network/failure.dart';
import 'package:core_data/src/data/responeses/model_country.dart';
import 'package:core_data/src/data/responeses/response_convert.dart';
import 'package:dartz/dartz.dart';

abstract class RepositoryHome {
  Future<Either<Failure, List<ModelCountry>>> getcountrys();
  Future<Either<Failure, ResponseConvert>> Convert(
      String from, String to, String amount);
  Future<Either<Failure, Responsehistorical>> getHistorical(
      String from, String to, String date);
}
