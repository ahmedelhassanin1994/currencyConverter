import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_convert/convert_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_country/country_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_selectCountry/select_country_cubit.dart';
import 'convert_cubitTest.mocks.dart';
import 'selectCountry_cubitTest.mocks.dart';


@GenerateMocks([AppPreferences])
void main() {
  late MockAppPreferences mockAppPreferences;
  late SelectCountryCubit selectCountryCubit;

  setUp(() {
    mockAppPreferences = MockAppPreferences();
    selectCountryCubit = SelectCountryCubit(mockAppPreferences);
  });

  group('SelectCountryCubit', () {
    test('initial state is correct', () {
      expect(
        selectCountryCubit.state,
        CountrySelectionState(
          selectedFromCountry: '',
          selectedToCountry: '',
          amount: '',
        ),
      );
    });

    blocTest<SelectCountryCubit, CountrySelectionState>(
      'emits updated state when selectFromCountry is called',
      build: () => selectCountryCubit,
      act: (cubit) => cubit.selectFromCountry('USA'),
      expect: () => [
        CountrySelectionState(
          selectedFromCountry: 'USA',
          selectedToCountry: '',
          amount: '',
        ),
      ],
    );

    blocTest<SelectCountryCubit, CountrySelectionState>(
      'emits updated state when selectToCountry is called',
      build: () => selectCountryCubit,
      act: (cubit) => cubit.selectToCountry('India'),
      expect: () => [
        CountrySelectionState(
          selectedFromCountry: '',
          selectedToCountry: 'India',
          amount: '',
        ),
      ],
    );

    blocTest<SelectCountryCubit, CountrySelectionState>(
      'emits updated state and calls setCurrencyFrom when updateSelectedCurrency is called with CurrencyInputType.from',
      build: () {
        when(mockAppPreferences.setCurrencyFrom(any))
            .thenAnswer((_) async => null);
        selectCountryCubit.updateSelectedType(CurrencyInputType.from);
        return selectCountryCubit;
      },
      act: (cubit) => cubit.updateSelectedCurrency('EUR'),
      verify: (_) {
        verify(mockAppPreferences.setCurrencyFrom('EUR')).called(1);
      },
      expect: () => [
        CountrySelectionState(
          selectedFromCountry: 'EUR',
          selectedToCountry: '',
          amount: '',
          currencyInputType: CurrencyInputType.from,
        ),
      ],
    );

    blocTest<SelectCountryCubit, CountrySelectionState>(
      'emits states when getLastCurrency is called',
      build: () {
        when(mockAppPreferences.getCurrencyFrom())
            .thenAnswer((_) async => 'USA');
        when(mockAppPreferences.getCurrencyTo())
            .thenAnswer((_) async => 'India');
        return selectCountryCubit;
      },
      act: (cubit) => cubit.getLastCurrency(),
      verify: (_) {
        verify(mockAppPreferences.getCurrencyFrom()).called(1);
        verify(mockAppPreferences.getCurrencyTo()).called(1);
      },
      expect: () => [
        CountrySelectionState(
          selectedFromCountry: 'USA',
          selectedToCountry: '',
          amount: '',
        ),
        CountrySelectionState(
          selectedFromCountry: 'USA',
          selectedToCountry: 'India',
          amount: '',
        ),
      ],
    );
  });
}