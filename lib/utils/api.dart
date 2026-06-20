import 'package:flutter_dotenv/flutter_dotenv.dart';

String get key => dotenv.env['API_KEY']?? "";
