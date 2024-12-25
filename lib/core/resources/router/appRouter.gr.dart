// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:mvvm_project/features/features_home/presentation/countrysScreen.dart'
    as _i1;
import 'package:mvvm_project/features/features_home/presentation/currencyConverter.dart'
    as _i2;
import 'package:mvvm_project/features/features_home/presentation/historicalScreen.dart'
    as _i3;
import 'package:mvvm_project/features/features_home/presentation/homeScreen.dart'
    as _i4;

/// generated route for
/// [_i1.CountrysScreen]
class CountrysRoute extends _i5.PageRouteInfo<void> {
  const CountrysRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CountrysRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountrysRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i1.CountrysScreen();
    },
  );
}

/// generated route for
/// [_i2.Currency_Converter]
class Currency_Converter extends _i5.PageRouteInfo<void> {
  const Currency_Converter({List<_i5.PageRouteInfo>? children})
      : super(
          Currency_Converter.name,
          initialChildren: children,
        );

  static const String name = 'Currency_Converter';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i2.Currency_Converter();
    },
  );
}

/// generated route for
/// [_i3.HistoricalScreen]
class HistoricalRoute extends _i5.PageRouteInfo<HistoricalRouteArgs> {
  HistoricalRoute({
    String? name,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HistoricalRoute.name,
          args: HistoricalRouteArgs(name: name),
          initialChildren: children,
        );

  static const String name = 'HistoricalRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HistoricalRouteArgs>(
          orElse: () => const HistoricalRouteArgs());
      return _i3.HistoricalScreen(name: args.name);
    },
  );
}

class HistoricalRouteArgs {
  const HistoricalRouteArgs({this.name});

  final String? name;

  @override
  String toString() {
    return 'HistoricalRouteArgs{name: $name}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i4.HomeScreen();
    },
  );
}
