import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/network/api_currencyConverter.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';

import 'remote_data_source_home.mocks.dart';



@GenerateMocks([ApiHome,ApiCurrencyConverter])
void main() {
  late RemoteDataSourceHomeImplementer remoteDataSource;
  late MockApiHome mockApiHome;
  late MockApiCurrencyConverter mockApiCurrencyConverter;

  setUp(() {
    mockApiHome = MockApiHome();
    mockApiCurrencyConverter=MockApiCurrencyConverter();
    remoteDataSource = RemoteDataSourceHomeImplementer(mockApiHome,mockApiCurrencyConverter);
  });

  group('getcountrys', () {
    test('should return a list of ModelCountry when ApiHome.getcountrys is called', () async {
      // Arrange: Set up mock return value
      final tcountrys = [
        ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
        ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
      ];
      when(mockApiHome.getcountrys()).thenAnswer((_) async => tcountrys);

      // Act: Call the method
      final result = await remoteDataSource.getcountrys();

      // Assert: Check if the result is as expected
      expect(result, tcountrys);
      verify(mockApiHome.getcountrys()).called(1);
    });

    test('should throw an Exception when ApiHome.getcountrys throws an error', () async {
      // Arrange: Set up mock to throw an exception
      when(mockApiHome.getcountrys()).thenThrow(Exception("Failed to fetch repos"));

      // Act & Assert: Verify that the exception is thrown
      expect(() => remoteDataSource.getcountrys(), throwsException);
      verify(mockApiHome.getcountrys()).called(1);
    });
  });

  group('Convert ', () {
    test('should return a object of ResponseConvert when ApiCurrencyConverter.Convert is called', () async {
      // Arrange: Set up mock return value
      final response =ResponseConvert(base: 'EGP',amount: '49.2',ms: 5,result: Result(rate:0.0202366 , currencies: {}));
      when(mockApiCurrencyConverter.Convert('EGP', 'USD', '49.2')).thenAnswer((_) async => response);

      // Act: Call the method
      final result = await remoteDataSource.Convert('EGP', 'USD', '49.2');

      // Assert: Check if the result is as expected
      expect(result, response);
      verify(mockApiCurrencyConverter.Convert('EGP', 'USD', '49.2')).called(1);
    });
    test('should throw an Exception when ApiCurrencyConverter.Convert throws an error', () async {
      // Arrange: Set up mock to throw an exception
      when(mockApiCurrencyConverter.Convert(any,any,any)).thenThrow(Exception("Failed to fetch repos"));

      // Act & Assert: Verify that the exception is thrown
      expect(() => remoteDataSource.Convert('EGP', 'USD', '49.2'), throwsException);
      verify(mockApiCurrencyConverter.Convert(any,any,any)).called(1);
    });

  });

  group('getHistorical ', () {
    test('should return a object of Responsehistorical when ApiCurrencyConverter.getHistorical is called', () async {
      // Arrange: Set up mock return value
      final response =Responsehistorical(base: 'EGP',date: '2024-11-12',ms: 5,results: {});
      when(mockApiCurrencyConverter.getHistorical('EGP', 'USD', '2024-11-12')).thenAnswer((_) async => response);

      // Act: Call the method
      final result = await remoteDataSource.getHistorical('EGP', 'USD', '2024-11-12');

      // Assert: Check if the result is as expected
      expect(result, response);
      verify(mockApiCurrencyConverter.getHistorical('EGP', 'USD', '2024-11-12')).called(1);
    });
    test('should throw an Exception when ApiCurrencyConverter.getHistorical throws an error', () async {
      // Arrange: Set up mock to throw an exception
      when(mockApiCurrencyConverter.getHistorical(any,any,any)).thenThrow(Exception("Failed to fetch repos"));

      // Act & Assert: Verify that the exception is thrown
      expect(() => remoteDataSource.getHistorical('EGP', 'USD', '2024-11-12'), throwsException);
      verify(mockApiCurrencyConverter.getHistorical(any,any,any)).called(1);
    });

  });

}
