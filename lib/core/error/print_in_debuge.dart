import 'package:flutter/foundation.dart';

printInDebug({required String ms}){
if(kDebugMode){
  print(ms);
}
}