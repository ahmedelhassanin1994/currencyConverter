


import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/appRouter.gr.dart';
import 'package:mvvm_project/features/features_home/presentation/countrysScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {

  const HomeScreen();

  @override
  _HomeScreen createState() => _HomeScreen();
}


class _HomeScreen extends State<HomeScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }




  Widget getContentWidget(){

    return  AutoTabsRouter.pageView(
      routes: [
        Currency_Converter(),
        HistoricalRoute(name: ''),
        CountrysRoute()

      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(context.topRoute.name),
            leading: AutoLeadingButton(),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(label: 'Books', icon: Icon(Icons.home), ),
              BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.date_range)),
              BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.cabin)),
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(),
      tablet: getContentWidget(),
      mobile: getContentWidget(),
    );
  }
}