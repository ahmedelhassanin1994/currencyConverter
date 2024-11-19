part of 'historical_cubit.dart';

@immutable
abstract class HistoricalState extends Equatable{
  const HistoricalState();

  @override
  List<Object?> get props => [];
}

final class HistoricalInitial extends HistoricalState {}
final class HistoricalLoading extends HistoricalState {}
final class HistoricalLoaaded extends HistoricalState {
  late Responsehistorical historical;

  HistoricalLoaaded(this.historical);
}
final class  HistoricalError extends HistoricalState {
  late Failure failure;

  HistoricalError(this.failure);
}
