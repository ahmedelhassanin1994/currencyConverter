import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class ConvertUseCase implements BaseCase<InputConvertUseCase,ResponseConvert> {
  final RepositoryHome _repository;

  ConvertUseCase(this._repository);

  @override
  Future<Either<Failure,ResponseConvert>> execute(InputConvertUseCase input) async {
    return await _repository.Convert(input.from.toString(), input.to.toString(), input.amount.toString());

  }
}

class InputConvertUseCase{
  String? from;
  String? to;
  String? amount;

  InputConvertUseCase(this.from, this.to, this.amount);

}
