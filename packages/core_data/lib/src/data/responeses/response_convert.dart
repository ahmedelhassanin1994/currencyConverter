class ResponseConvert {
  String? base;
  dynamic? amount;
  Result? result;
  int? ms;
  String? currencyName;
  dynamic amount_converted;

  ResponseConvert({this.base, this.amount, this.result, this.ms});

  ResponseConvert.fromJson(Map<String, dynamic> json) {
    final currencies = json['result'] ?? {};
    final currencyCode =
        currencies.keys.isNotEmpty ? currencies.keys.first : "Unknown";

    base = json['base'];
    amount = json['amount'];
    ms = json['ms'];
    currencyName = currencyCode;
    amount_converted = json['$currencyCode'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['amount'] = this.amount;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['ms'] = this.ms;
    return data;
  }
}

class Result {
  final Map<String, dynamic> currencies; // Holds the dynamic keys and values
  dynamic? rate;

  Result({
    required this.currencies,
    required this.rate,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    // Extract all keys except "rate" and treat them as dynamic currency data
    final currencyData = Map<String, dynamic>.from(json)..remove('rate');

    return Result(
      currencies: currencyData,
      rate: (json['rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ...currencies, // Include all dynamic currency keys
      'rate': rate,
    };
  }
}

class Responsehistorical {
  String? date;
  String? base;
  Map<String, dynamic>? results;
  int? ms;

  Responsehistorical({this.date, this.base, this.results, this.ms});

  Responsehistorical.fromJson(Map<String, dynamic> json) {
    final currencyData = Map<String, dynamic>.from(json)..remove('');

    date = json['date'];
    base = json['base'];
    ms = json['ms'];
    results = json['results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['base'] = this.base;
    data['ms'] = this.ms;
    return data;
  }
}
