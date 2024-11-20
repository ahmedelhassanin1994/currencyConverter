import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';

import 'country_usecase.mocks.dart';


@GenerateMocks([RepositoryHome])
void main() {
  late MockRepositoryHome mockRepositoryHome;
  late CountryUseCase countryUseCase;

  setUp(() {
    mockRepositoryHome = MockRepositoryHome();
    countryUseCase = CountryUseCase(mockRepositoryHome);
  });


  group('getcountrys', (){

    final tcountrys = [
      ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
      ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
    ];
    test('should return a list of Country on success', () async {
      // Arrange
      when(mockRepositoryHome.getcountrys()).thenAnswer(
            (_) async =>
            Right(tcountrys),
      );

      // Act
      final result = await countryUseCase.execute(InputUseCase());

      // Assert
      expect(result, isA<Right<Failure, List<ModelCountry>>>());

    });
      test('should return a Failure on error', () async {
        // Arrange
        when(mockRepositoryHome.getcountrys()).thenAnswer(
              (_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()),
        );

        // Act
        final result = await countryUseCase.execute(InputUseCase());

        // Assert
        expect(result, isA<Left<Failure, List<ModelCountry>>>());
      });
});

}