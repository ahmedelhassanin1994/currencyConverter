import 'package:core_data/src/core/common/base/base_usecase.dart';
import 'package:core_data/src/core/common/network/failure.dart';
import 'package:core_data/src/data/responeses/model_country.dart';
import 'package:core_data/src/domain/repository/repository_home.dart';
import 'package:dartz/dartz.dart';

class CountryUseCase implements BaseCase<InputUseCase, List<ModelCountry>> {
  final RepositoryHome _repository;

  CountryUseCase(this._repository);

  @override
  Future<Either<Failure, List<ModelCountry>>> execute(
      InputUseCase input) async {
    return await _repository.getcountrys();
  }
}

class InputUseCase {}
