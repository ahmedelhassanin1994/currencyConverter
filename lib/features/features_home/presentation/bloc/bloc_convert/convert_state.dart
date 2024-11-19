part of 'convert_cubit.dart';

@immutable
abstract class ConvertState extends Equatable{
  const ConvertState();

  @override
  List<Object?> get props => [];
}

final class ConvertInitial extends ConvertState {}
final class ConvertLoading extends ConvertState {}
final class ConvertLoaaded extends ConvertState {
  late ResponseConvert convert;

  ConvertLoaaded(this.convert);
}
final class ConvertError extends ConvertState {
  late Failure failure;

  ConvertError(this.failure);
}
