


import 'package:hive/hive.dart';
part 'model_country.g.dart';

@HiveType(typeId: 2)
class ModelCountry{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? code;
  @HiveField(2)
  String? flag;
  @HiveField(3)
  String? currencyName;
  @HiveField(4)
  String? currencySymbol;

  ModelCountry({
    required this.name,
    required this.code,
    required this.flag,
    required this.currencyName,
    required this.currencySymbol,
  });

  // factory ModelCountry.fromJson(Map<String, dynamic> json) {
  //   final currencies = json['currencies'] ?? {};
  //   final currencyCode = currencies.keys.isNotEmpty ? currencies.keys.first : "Unknown";
  //   return ModelCountry(
  //     name: json['name']['common'],
  //     code: json['cca2'],
  //     flag: json['flags']['png'],
  //     currencyName: '${currencyCode}',
  //     currencySymbol: '${currencyCode}',
  //   );
  // }

  ModelCountry.fromJson(Map<String, dynamic> json) {
     final currencies = json['currencies'] ?? {};
     final currencyCode = currencies.keys.isNotEmpty ? currencies.keys.first : "Unknown";
     name= json['name']['common'];
     code= json['cca2'];
     flag= json['flags']['png'];
     currencyName= '${currencyCode}';
     currencySymbol= '${currencyCode}';
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cca2'] = this.code;
    data['flags'] = this.flag;
    data['currencyName'] = this.currencyName;
    data['currencySymbol'] = this.currencySymbol;
    return data;
  }
}
