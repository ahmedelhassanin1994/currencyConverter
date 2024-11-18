import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';

part 'select_country_state.dart';

class SelectCountryCubit extends Cubit<CountrySelectionState> {

  String _amount = "";
  String get amount => _amount;
  CurrencyInputType? updatingCurrencyType;
  late AppPreferences appPreferences;

  SelectCountryCubit(this.appPreferences) : super(CountrySelectionState(
    selectedFromCountry:'',
    selectedToCountry:'',
  ));

  void selectFromCountry(String country) {
    emit(state.copyWith(selectedFromCountry: country));
  }

  void selectToCountry(String country) {
    emit(state.copyWith(selectedToCountry: country));
  }

  updateSelectedCurrency(String model) {
    print("state : ${state.currencyInputType}");
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

  void getLastCurrency()async{
    final lastselectedFromCountry=await appPreferences.getCurrencyFrom();
    final lastselectedToCountry=await appPreferences.getCurrencyTo();
    emit(state.copyWith(selectedFromCountry: lastselectedFromCountry));
    emit(state.copyWith(selectedToCountry: lastselectedToCountry));
  }

}
