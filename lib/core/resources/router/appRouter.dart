

import 'package:auto_route/auto_route.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';

import 'appRouter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: HomeRoute.page,initial: true,path: '/HomeRoute',children: [
      AutoRoute(page: Currency_Converter.page,path: 'Currency_Converter'),
      AutoRoute(page: CountrysRoute.page,path: 'CountrysRoute'),
      AutoRoute(page: HistoricalRoute.page,path:  'HistoricalRoute'),
    ]),

  ];

}


//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: Text(AppStrings.noRouteFound),
//               ),
//               body: Center(
//                 child: Text(AppStrings.noRouteFound),
//               ),
//             ));
//   }
// }