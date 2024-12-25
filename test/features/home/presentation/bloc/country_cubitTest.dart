// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mvvm_project/core/common/network/error_handler.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
// import 'package:mvvm_project/core/common/network/failure.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
// import 'country_cubitTest.mocks.dart';
//
//
// @GenerateMocks([CountryUseCase])
// void main() {
//   late MockCountryUseCase mockReposUseCase;
//   late CountryCubit reposCubit;
//
//   setUp(() {
//     mockReposUseCase = MockCountryUseCase();
//     reposCubit = CountryCubit(mockReposUseCase);
//   });
//
//   test('initial state is ReposInitial', () {
//     expect(reposCubit.state, CountryLoading());
//   });
//
//   group('get_featchData', () {
//     final tcountrys = [
//       ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
//       ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
//     ];
//
//     blocTest<CountryCubit, CountryState>(
//       'emits [CountryLoading, CountryLoaaded] when data fetch is successful',
//       build: () => reposCubit,
//       act: (cubit) {
//         when(mockReposUseCase.execute(any)).thenAnswer((_) async => Right(tcountrys));
//         cubit.get_getcountrys();
//       },
//       expect: () => [
//         CountryLoading(),
//         CountryLoaaded(tcountrys),
//       ],
//     );
//
//     blocTest<CountryCubit, CountryState>(
//       'emits [CountryLoading, CountryLoaaded] when data fetch fails',
//       build: () => reposCubit,
//       act: (cubit) {
//         when(mockReposUseCase.execute(any)).thenAnswer((_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()));
//         cubit.get_getcountrys();
//       },
//       expect: () => [
//         CountryLoading(),
//         CountryError(DataSource.NI_INTERNET_CONNECTION.getFailure()),
//       ],
//     );
//   });
// }