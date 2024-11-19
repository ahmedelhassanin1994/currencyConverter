part of 'country_cubit.dart';

@immutable
abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

final class CountryInitial extends CountryState {}
final class CountryLoading extends CountryState {}
final class CountryLoaaded extends CountryState {
  List<ModelCountry> countrys;

  CountryLoaaded(this.countrys);
}
final class SearchLoaaded extends CountryState {
  List<ModelCountry> countrys;

  SearchLoaaded(this.countrys);
}
final class CountryError extends CountryState {
  late Failure failure;

  CountryError(this.failure);
}