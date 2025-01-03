import 'package:core_data/src/core/common/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

abstract class BaseCaseAdd<In> {
  Future<void> execute(In input);
}

abstract class BaseCaseVoid {
  Future<void> execute();
}
