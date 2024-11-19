import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class HistoricalUseCase implements BaseCase<InputHistoricalUseCase,Responsehistorical> {
  final RepositoryHome _repository;

  HistoricalUseCase(this._repository);

  @override
  Future<Either<Failure,Responsehistorical>> execute(InputHistoricalUseCase input) async {
    return await _repository.getHistorical(input.from.toString(), input.to.toString(), input.date.toString());

  }
}

class InputHistoricalUseCase{
  String? from;
  String? to;
  String? date;

  InputHistoricalUseCase(this.from, this.to, this.date);

}
