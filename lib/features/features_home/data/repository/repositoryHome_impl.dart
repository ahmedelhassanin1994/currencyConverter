

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
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


}
