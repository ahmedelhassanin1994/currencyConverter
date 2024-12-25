// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mvvm_project/core/common/network/error_handler.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/historical_usecase.dart';
// import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_historical/historical_cubit.dart';
// import 'historical_cubitTest.mocks.dart';
//
//
// @GenerateMocks([HistoricalUseCase])
// void main() {
//   late MockHistoricalUseCase mockHistoricalUseCase;
//   late HistoricalCubit historicalCubit;
//
//   setUp(() {
//     mockHistoricalUseCase = MockHistoricalUseCase();
//     historicalCubit = HistoricalCubit(mockHistoricalUseCase);
//   });
//
//   test('initial state is HistoricalInitial', () {
//     expect(historicalCubit.state, HistoricalInitial());
//   });
//
//   group('get  Historical', () {
//     final response = Responsehistorical();
//
//     blocTest<HistoricalCubit, HistoricalState>(
//       'emits [HistoricalLoading, HistoricalLoaaded] when data fetch is successful',
//       build: () => historicalCubit,
//       act: (cubit) {
//         when(mockHistoricalUseCase.execute(any)).thenAnswer((_) async => Right(response));
//         cubit.getHistorical("USD", "EGP",);
//       },
//       expect: () => [
//         HistoricalLoading(),
//         HistoricalLoaaded(response),
//       ],
//     );
//
//     blocTest<HistoricalCubit, HistoricalState>(
//       'emits [CountryLoading, CountryLoaaded] when data fetch fails',
//       build: () => historicalCubit,
//       act: (cubit) {
//         when(mockHistoricalUseCase.execute(any)).thenAnswer((_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()));
//         cubit.getHistorical("USD", "EGP");
//       },
//       expect: () => [
//         HistoricalLoading(),
//         HistoricalError(DataSource.NI_INTERNET_CONNECTION.getFailure()),
//       ],
//     );
//   });
// }