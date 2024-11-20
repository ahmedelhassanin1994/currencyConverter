import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/historical_usecase.dart';

import 'historical_usecase.mocks.dart';


@GenerateMocks([RepositoryHome])
void main() {
  late MockRepositoryHome mockRepositoryHome;
  late HistoricalUseCase historicalUseCase;

  setUp(() {
    mockRepositoryHome = MockRepositoryHome();
    historicalUseCase = HistoricalUseCase(mockRepositoryHome);
  });


  group('Convert', (){
    final response = Responsehistorical();

    test('should return a ResponseConvert on success', () async {
      // Arrange
      when(mockRepositoryHome.getHistorical("USD", "EGP", "2024-11-15")).thenAnswer(
            (_) async =>
            Right(response),
      );

      // Act
      final result = await historicalUseCase.execute(InputHistoricalUseCase("USD", "EGP", "2024-11-15"));

      // Assert
      expect(result, isA<Right<Failure, Responsehistorical>>());

    });
      test('should return a Failure on error', () async {
        // Arrange
        when(mockRepositoryHome.getHistorical("USD", "EGP", "2024-11-15")).thenAnswer(
              (_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()),
        );

        // Act
        final result = await historicalUseCase.execute(InputHistoricalUseCase("USD", "EGP", "2024-11-15"));

        // Assert
        expect(result, isA<Left<Failure, Responsehistorical>>());
      });
});

}