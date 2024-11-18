part of 'repos_cubit.dart';

@immutable
abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object?> get props => [];
}

final class ReposInitial extends ReposState {}
final class ReposLoading extends ReposState {}
final class ReposLoaaded extends ReposState {
  List<ModelCountry> countrys;

  ReposLoaaded(this.countrys);
}
final class SearchLoaaded extends ReposState {
  List<ModelCountry> countrys;

  SearchLoaaded(this.countrys);
}
final class ReposError extends ReposState {
  late Failure failure;

  ReposError(this.failure);
}