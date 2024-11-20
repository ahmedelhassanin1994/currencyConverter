import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';
import 'package:mvvm_project/features/features_home/data/repository/repositoryHome_impl.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import '../../../../core_test/network_info_test.mocks.dart';
import 'repositoryHome_impl.mocks.dart';



@GenerateMocks([RemoteDataSourceHome,NetworkInfo,LocalDataSource])
void main() {
  late MockRemoteDataSourceHome mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late RepositoryHomeImpl repository;



  setUp(() {
    mockRemoteDataSource = MockRemoteDataSourceHome();
    mockLocalDataSource = MockLocalDataSource();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
    repository = RepositoryHomeImpl(mockRemoteDataSource, networkInfo, mockLocalDataSource);

  });

  group('getcountrys', () {
    final tcountrys = [
      ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
      ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
    ];
    test('should fetch remote data when online and cache is empty', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockLocalDataSource.getCache()).thenAnswer((_) async => []);
      when(mockRemoteDataSource.getcountrys()).thenAnswer((_) async => tcountrys);

      // Act
      final result = await repository.getcountrys();

      final resultList = (result as Right<Failure, List<ModelCountry>>).value;
      expect(resultList.length, tcountrys.length);
      for (var i = 0; i < tcountrys.length; i++) {
        expect(resultList[i].name, tcountrys[i].name);
      }

      // Assert
      expect(result, Right(tcountrys));
      verify(mockRemoteDataSource.getcountrys()).called(1);
      verify(mockLocalDataSource.AddCache(tcountrys)).called(1);
    });

    test('should return cached data when online and cache is not empty', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockLocalDataSource.getCache()).thenAnswer((_) async => tcountrys);

      // Act
      final result = await repository.getcountrys();

      // Assert
      expect(result, Right(tcountrys));
      verifyNever(mockRemoteDataSource.getcountrys());
    });

    test('should return cached data when offline', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCache()).thenAnswer((_) async => tcountrys);

      // Act
      final result = await repository.getcountrys();

      // Assert
      expect(result, Right(tcountrys));
      verifyNever(mockRemoteDataSource.getcountrys());
    });

    test('should return failure when remote fetch fails', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockLocalDataSource.getCache()).thenAnswer((_) async => []);
      when(mockRemoteDataSource.getcountrys()).thenThrow(Exception());

      // Act
      final result = await repository.getcountrys();

      // Assert
      expect(result, isA<Left<Failure, List<ModelCountry>>>());
      verify(mockLocalDataSource.getCache()).called(1);
    });
  });

  group('Convert', () {
    final response = ResponseConvert();
    test('should fetch remote data when online', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.Convert("USD","EGP" , "50")).thenAnswer((_) async => response);

      // Act
      final result = await repository.Convert("USD","EGP" , "50");


      // Assert
      expect(result, Right(response));
      verify(mockRemoteDataSource.Convert("USD","EGP" , "50")).called(1);
    });


    test('should return failure when remote fetch fails', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.Convert("USD","EGP" , "50")).thenThrow(Exception());

      // Act
      final result = await repository.Convert("USD","EGP" , "50");

      // Assert
      expect(result, isA<Left<Failure, ResponseConvert>>());
    });
  });


}
