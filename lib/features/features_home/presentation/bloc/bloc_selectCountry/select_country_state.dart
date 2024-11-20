part of 'select_country_cubit.dart';

enum CurrencyInputType { to, from }

class CountrySelectionState extends Equatable{
  final String selectedFromCountry;
  final String selectedToCountry;
  late String amount;
  CurrencyInputType? currencyInputType;


  CountrySelectionState({
    required this.selectedFromCountry,
    required this.selectedToCountry,
    required this.amount,
    this.currencyInputType

  });

  // Copy method to create a new state with updated values
  CountrySelectionState copyWith({
    String? selectedFromCountry,
    String? selectedToCountry,
    String? amount,
    CurrencyInputType? currencyInputType,
  }) {
    return CountrySelectionState(
      selectedFromCountry: selectedFromCountry ?? this.selectedFromCountry,
      selectedToCountry: selectedToCountry ?? this.selectedToCountry,
      amount: amount ??this.amount,
      currencyInputType:  currencyInputType ?? this.currencyInputType
    );
  }

  // TODO: implement props
  @override
  List<Object?> get props => [
    selectedFromCountry,
    selectedToCountry,
    amount,
    currencyInputType,
  ];}
