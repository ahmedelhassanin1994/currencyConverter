import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class CountryUseCase implements BaseCase<InputUseCase,List<ModelCountry>> {
  final RepositoryHome _repository;

  CountryUseCase(this._repository);

  @override
  Future<Either<Failure,List<ModelCountry>>> execute(InputUseCase input) async {
    return await _repository.getcountrys();
  }
}

class InputUseCase{

}
