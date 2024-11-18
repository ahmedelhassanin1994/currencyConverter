import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/repos_usecase.dart';

part 'repos_state.dart';

class ReposCubit extends Cubit<ReposState> {

  late ReposUseCase reposUseCase;
  List<ModelCountry> searchCountry=[];
  List<ModelCountry> allCountry=[];
  late bool isSearching = false;


  ReposCubit(this.reposUseCase) : super(ReposLoading());

  Future<void>get_getcountrys() async{
    emit(ReposLoading());
    (await reposUseCase.execute(
        InputUseCase())).fold((
        l) =>
    {
      emit(ReposError(l)),


    }, (r) =>
    {
      allCountry=r,
      emit(ReposLoaaded(r)),

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
    emit(ReposLoaaded(allCountry));

  }

}
