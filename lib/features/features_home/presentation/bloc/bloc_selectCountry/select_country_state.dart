part of 'select_country_cubit.dart';

enum CurrencyInputType { to, from }

class CountrySelectionState {
  final String selectedFromCountry;
  final String selectedToCountry;
  late String amount;
  CurrencyInputType? currencyInputType;


  CountrySelectionState({
    required this.selectedFromCountry,
    required this.selectedToCountry,
    this.currencyInputType

  });

  // Copy method to create a new state with updated values
  CountrySelectionState copyWith({
    String? selectedFromCountry,
    String? selectedToCountry,
    CurrencyInputType? currencyInputType,
  }) {
    return CountrySelectionState(
      selectedFromCountry: selectedFromCountry ?? this.selectedFromCountry,
      selectedToCountry: selectedToCountry ?? this.selectedToCountry,
      currencyInputType:  currencyInputType ?? this.currencyInputType
    );
  }
}
