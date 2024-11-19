import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';

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
