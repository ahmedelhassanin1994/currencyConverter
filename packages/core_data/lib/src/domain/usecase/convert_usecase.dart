import 'package:core_data/src/core/common/base/base_usecase.dart';
import 'package:core_data/src/core/common/network/failure.dart';
import 'package:core_data/src/data/responeses/response_convert.dart';
import 'package:core_data/src/domain/repository/repository_home.dart';
import 'package:dartz/dartz.dart';

class ConvertUseCase implements BaseCase<InputConvertUseCase, ResponseConvert> {
  final RepositoryHome _repository;

  ConvertUseCase(this._repository);

  @override
  Future<Either<Failure, ResponseConvert>> execute(
      InputConvertUseCase input) async {
    return await _repository.Convert(
        input.from.toString(), input.to.toString(), input.amount.toString());
  }
}

class InputConvertUseCase {
  String? from;
  String? to;
  String? amount;

  InputConvertUseCase(this.from, this.to, this.amount);
}
