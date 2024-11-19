

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/responeses/response_convert.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class RepositoryHomeImpl extends RepositoryHome {
  late RemoteDataSourceHome _remoteDataSource;
  late LocalDataSource localDataSource;
  late NetworkInfo _networkInfo;

  RepositoryHomeImpl(this._remoteDataSource, this._networkInfo, this.localDataSource);



  @override
  Future<Either<Failure,List<ModelCountry>>> getcountrys() async{
    // TODO: implement categories
    if (await _networkInfo.isConnected) {
      final data=await localDataSource.getCache();
      if(data.isNotEmpty){
        return Right(data);
      }else{
      try {
        final response = await _remoteDataSource.getcountrys();
        localDataSource.deleteLocal(Constant.localKey);
        localDataSource.AddCache(response);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    }} else {
      try{
        final data=await localDataSource.getCache();
        return Right(data);

      }catch(e){
        return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
      }
  }

  }


  @override
  Future<Either<Failure, ResponseConvert>> Convert(String from, String to, String amount) async{
    // TODO: implement Convert
    if (await _networkInfo.isConnected) {
    try{
      final response=await _remoteDataSource.Convert(from, to, amount);
      return Right(response);
    }catch(e){
      return Left(ErrorHandler.handle(e).failure);
    }
    }else{
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());

    }
    }

  @override
  Future<Either<Failure, Responsehistorical>> getHistorical(String from, String to, String date)async {
    // TODO: implement getHistorical
    if (await _networkInfo.isConnected) {
      final response=await _remoteDataSource.getHistorical(from, to, date);
      return Right(response);

    }else{
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());

    }

    }


  }

