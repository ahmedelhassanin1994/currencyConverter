import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {


  //key cache
  static const localKey="ModelCache";


  static final Constant _instance = Constant._internal();

  Constant._internal();

  static Constant get instance => _instance;



}
