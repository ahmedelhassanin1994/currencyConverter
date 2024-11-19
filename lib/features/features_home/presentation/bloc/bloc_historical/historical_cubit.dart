import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/historical_usecase.dart';

part 'historical_state.dart';

class HistoricalCubit extends Cubit<HistoricalState> {
  late HistoricalUseCase historicalUseCase;

  HistoricalCubit(this.historicalUseCase) : super(HistoricalInitial());


  Future<void>getHistorical( String from, String to, String date) async{
    emit(HistoricalLoading());
    (await historicalUseCase.execute(
        InputHistoricalUseCase(from,to,date))).fold((
        l) =>
    {
      emit(HistoricalError(l)),
    }, (r) =>
    {
      emit(HistoricalLoaaded(r)),

    });
  }
}
