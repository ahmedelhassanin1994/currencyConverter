// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mvvm_project/core/common/network/error_handler.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
// import 'package:mvvm_project/core/common/network/failure.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
// import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
// import 'convert_cubitTest.mocks.dart';
//
//
// @GenerateMocks([ConvertUseCase])
// void main() {
//   late MockConvertUseCase mockConvertUseCase;
//   late ConvertCubit convertCubit;
//
//   setUp(() {
//     mockConvertUseCase = MockConvertUseCase();
//     convertCubit = ConvertCubit(mockConvertUseCase);
//   });
//
//   test('initial state is ConvertInitial', () {
//     expect(convertCubit.state, ConvertInitial());
//   });
//
//   group('Convert', () {
//     final response = ResponseConvert();
//
//     blocTest<ConvertCubit, ConvertState>(
//       'emits [ConvertLoading, ConvertLoaaded] when data fetch is successful',
//       build: () => convertCubit,
//       act: (cubit) {
//         when(mockConvertUseCase.execute(any)).thenAnswer((_) async => Right(response));
//         cubit.Convert("USD", "EGP", "50");
//       },
//       expect: () => [
//         ConvertLoading(),
//         ConvertLoaaded(response),
//       ],
//     );
//
//     blocTest<ConvertCubit, ConvertState>(
//       'emits [CountryLoading, CountryLoaaded] when data fetch fails',
//       build: () => convertCubit,
//       act: (cubit) {
//         when(mockConvertUseCase.execute(any)).thenAnswer((_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()));
//         cubit.Convert("USD", "EGP", "50");
//       },
//       expect: () => [
//         ConvertLoading(),
//         ConvertError(DataSource.NI_INTERNET_CONNECTION.getFailure()),
//       ],
//     );
//   });
// }