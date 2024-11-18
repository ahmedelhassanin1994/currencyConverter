import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_country.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardCountry extends StatelessWidget {
  final ModelCountry modelCountry;

  CardCountry(this.modelCountry);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:  Padding(
        padding:  EdgeInsets.symmetric(
          vertical: AppPading.p5.w,
          horizontal: AppPading.p5.w,
        ),
        child: Row(
          children: [
        Container(
          width: AppSize.s8.w,
          height: AppSize.s8.w,
          decoration: BoxDecoration(
            color: ColorManager.grey,
            image: DecorationImage(image: CachedNetworkImageProvider(modelCountry.flag.toString()),
                fit: BoxFit.fill,),

          )),

             SizedBox(
              width: AppSize.s3.w,
            ),
            Expanded(
              flex: 1,
              child: Text(
                "${modelCountry.name}",
                style:getMediumStyle(color: ColorManager.black),
              ),
            ),
            SizedBox(
              width: AppSize.s3.w,
            ),
            Expanded(
              flex: 0,
              child: Text(
                "${modelCountry.currencySymbol}",
                style: getMediumStyle(color: ColorManager.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
