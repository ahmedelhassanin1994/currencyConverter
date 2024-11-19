class Constant {
  static const String baseUrl = "https://restcountries.com/";
  static const String baseUrl_providor = "https://api.fastforex.io/";
  static const int SliderCount = 5;
  static const api_key="feb466c199-9c670905e6-sn3ff0";


   //key cache
  static const localKey="ModelCache";



  static final Constant _instance = Constant._internal();

  Constant._internal();

  static Constant get instance => _instance;

}
