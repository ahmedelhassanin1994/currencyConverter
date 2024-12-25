import 'package:bloc/bloc.dart';
import 'package:core_data/core_data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'convert_state.dart';

class ConvertCubit extends Cubit<ConvertState> {
  late ConvertUseCase reposUseCase;

  ConvertCubit(this.reposUseCase) : super(ConvertInitial());


  Future<void>Convert( String from, String to, String amount) async{
    emit(ConvertLoading());
    (await reposUseCase.execute(
        InputConvertUseCase(from,to,amount))).fold((
        l) =>
    {
      emit(ConvertError(l)),
    }, (r) =>
    {
      emit(ConvertLoaaded(r)),

    });
  }
}
