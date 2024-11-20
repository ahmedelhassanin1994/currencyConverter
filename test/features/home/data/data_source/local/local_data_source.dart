import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:hive/hive.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'local_data_source.mocks.dart';
class MockLocalDataSource extends LocalDataSourceImplementer {
  final MockBox<ModelCountry> mockBox;

  MockLocalDataSource(this.mockBox);

  @override
  Future<Box<ModelCountry>> Openbox() async => mockBox;
}

@GenerateMocks([Box])
void main() {
  late MockLocalDataSource localDataSource;
  late MockBox<ModelCountry> mockBox;

  setUp(() {
    mockBox = MockBox<ModelCountry>();
    localDataSource = MockLocalDataSource(mockBox);
  });

  group('AddCache', () {
    test('should add a Model_Cache to the box', () async {
      final tcountrys = [
        ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
        ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
      ];
      // Stub the add method
      when(mockBox.addAll(tcountrys)).thenAnswer((_) async => [1]);

      await localDataSource.AddCache(tcountrys);

      verify(mockBox.addAll(tcountrys)).called(1);
    });
  });

  group('deleteLocal', () {
    test('should delete an item by title from the box', () async {

      // Arrange
      when(mockBox.clear()).thenAnswer((_) async => 0);

      // Stub Openbox to return the mock box
      when(mockBox.toMap()).thenReturn({});

      // Act
      await localDataSource.deleteLocal('Country1');

      // Assert
      verify(mockBox.clear()).called(1);
    });
  });

  group('getCache', () {
    test('should return a Model_Cache with the specified key', () async {
      final tcountrys = [
        ModelCountry(name: 'Egypt',code: 'EG',flag: 'flag.png',currencyName: 'EGP',currencySymbol: 'EGP'),
        ModelCountry(name: 'united states',code: 'USA',flag: 'flag2.png',currencyName: 'USA',currencySymbol: 'USA'),
      ];


      when(mockBox.values).thenReturn(tcountrys);

      final result =await  localDataSource.getCache();

      expect(result, tcountrys);



    });
  });
}