import 'package:shared_preferences/shared_preferences.dart';



const String PREFS_FROM_CURRENCY="PREFS_FROM_CURRENCY";
const String PREFS_FROM_TOCURRENCY="PREFS_FROM_TOCURRENCY";



class AppPreferences{

  late SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getCurrencyFrom() async{
    String? currency=_sharedPreferences.getString(PREFS_FROM_CURRENCY);

    if(currency !=null && currency.isNotEmpty){

      return currency;
    }else{
      return "EGP";
    }
  }
  Future<String> getCurrencyTo() async{
    String? currency=_sharedPreferences.getString(PREFS_FROM_TOCURRENCY);

    if(currency !=null && currency.isNotEmpty){

      return currency;
    }else{
      return "USD";
    }
  }
  Future<void> setCurrencyFrom(String currency) async{
    _sharedPreferences.setString(PREFS_FROM_CURRENCY,currency);
  }

  Future<void> setCurrencyTO(String currency) async{
    _sharedPreferences.setString(PREFS_FROM_TOCURRENCY,currency);
  }
}