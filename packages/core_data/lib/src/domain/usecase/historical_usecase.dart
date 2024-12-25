import 'package:core_data/src/core/common/base/base_usecase.dart';
import 'package:core_data/src/core/common/network/failure.dart';
import 'package:core_data/src/data/responeses/response_convert.dart';
import 'package:core_data/src/domain/repository/repository_home.dart';
import 'package:dartz/dartz.dart';

class HistoricalUseCase
    implements BaseCase<InputHistoricalUseCase, Responsehistorical> {
  final RepositoryHome _repository;

  HistoricalUseCase(this._repository);

  @override
  Future<Either<Failure, Responsehistorical>> execute(
      InputHistoricalUseCase input) async {
    return await _repository.getHistorical(
        input.from.toString(), input.to.toString(), input.date.toString());
  }
}

class InputHistoricalUseCase {
  String? from;
  String? to;
  String? date;

  InputHistoricalUseCase(this.from, this.to, this.date);
}
