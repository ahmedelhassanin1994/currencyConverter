// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mvvm_project/core/common/network/error_handler.dart';
// import 'package:mvvm_project/core/common/network/failure.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
// import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
// import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/convert_usecase.dart';
// import 'package:mvvm_project/features/features_home/domain/usecase/country_usecase.dart';
//
// import 'convert_usecase.mocks.dart';
//
//
// @GenerateMocks([RepositoryHome])
// void main() {
//   late MockRepositoryHome mockRepositoryHome;
//   late ConvertUseCase convertUseCase;
//
//   setUp(() {
//     mockRepositoryHome = MockRepositoryHome();
//     convertUseCase = ConvertUseCase(mockRepositoryHome);
//   });
//
//
//   group('Convert', (){
//     final response = ResponseConvert();
//
//     test('should return a ResponseConvert on success', () async {
//       // Arrange
//       when(mockRepositoryHome.Convert("USD", "EGP", "50")).thenAnswer(
//             (_) async =>
//             Right(response),
//       );
//
//       // Act
//       final result = await convertUseCase.execute(InputConvertUseCase("USD", "EGP", "50"));
//
//       // Assert
//       expect(result, isA<Right<Failure, ResponseConvert>>());
//
//     });
//       test('should return a Failure on error', () async {
//         // Arrange
//         when(mockRepositoryHome.Convert("USD", "EGP", "50")).thenAnswer(
//               (_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()),
//         );
//
//         // Act
//         final result = await convertUseCase.execute(InputConvertUseCase("USD", "EGP", "50"));
//
//         // Assert
//         expect(result, isA<Left<Failure, ResponseConvert>>());
//       });
// });
//
// }