import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static  String baseUrl = "${dotenv.env['baseUrl']}";
  static  String baseUrl_providor = "${dotenv.env['baseUrl_providor']}";
  static const int SliderCount = 5;
  static String api_key="${dotenv.env['api_key']}";


   //key cache
  static const localKey="ModelCache";



  static final Constant _instance = Constant._internal();

  Constant._internal();

  static Constant get instance => _instance;

}
