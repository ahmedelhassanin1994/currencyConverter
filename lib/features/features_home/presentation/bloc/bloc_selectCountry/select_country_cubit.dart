import 'package:bloc/bloc.dart';
import 'package:core_data/core_data.dart';
import 'package:equatable/equatable.dart';

part 'select_country_state.dart';

class SelectCountryCubit extends Cubit<CountrySelectionState> {

  String _amount = "";
  String get amount => _amount;
  CurrencyInputType? updatingCurrencyType;
  late AppPreferences appPreferences;

  SelectCountryCubit(this.appPreferences) : super(CountrySelectionState(
    selectedFromCountry:'',
    selectedToCountry:'',
    amount: '',
  ));

  void selectFromCountry(String country) {
    emit(state.copyWith(selectedFromCountry: country));
  }

  void selectToCountry(String country) {
    emit(state.copyWith(selectedToCountry: country));
  }

  updateSelectedCurrency(String model) {
    if (state.currencyInputType == CurrencyInputType.to) {
      emit(state.copyWith(selectedToCountry: model));
      appPreferences.setCurrencyTO(model);
    } else {
      emit(state.copyWith(selectedFromCountry: model));
      appPreferences.setCurrencyFrom(model);

    }
  }
  updateSelectedType(CurrencyInputType currenttype){
    emit(state.copyWith(currencyInputType: currenttype));

  }
  void setAmount(String amount) {
    emit(state.copyWith(amount: amount));
  }

  void getLastCurrency()async{
    final lastselectedFromCountry=await appPreferences.getCurrencyFrom();
    final lastselectedToCountry=await appPreferences.getCurrencyTo();
    emit(state.copyWith(selectedFromCountry: lastselectedFromCountry));
    emit(state.copyWith(selectedToCountry: lastselectedToCountry));
  }

}
