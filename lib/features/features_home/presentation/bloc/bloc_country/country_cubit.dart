import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {

  late CountryUseCase countryUseCase;
  List<ModelCountry> searchCountry=[];
  List<ModelCountry> allCountry=[];
  late bool isSearching = false;


  CountryCubit(this.countryUseCase) : super(CountryLoading());

  Future<void>get_getcountrys() async{
    emit(CountryLoading());
    (await countryUseCase.execute(
        InputUseCase())).fold((
        l) =>
    {
      emit(CountryError(l)),


    }, (r) =>
    {
      allCountry=r,
      emit(CountryLoaaded(r)),

    });
  }

  Future<void>search_getcountrys(String search)async {
    if (search.length >= 2) {
      isSearching=true;
    searchCountry = allCountry
        .where((character) =>
        character.name!.toLowerCase().startsWith(search))
        .toList();
    emit(SearchLoaaded(searchCountry));
    }else{
      closeSearch();
    }

  }
  Future<void>closeSearch()async {
    isSearching=false;
    emit(CountryLoaaded(allCountry));

  }

}
