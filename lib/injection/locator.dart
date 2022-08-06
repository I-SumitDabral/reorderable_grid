import 'package:get_it/get_it.dart';
import 'package:haicam/injection/locator.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;  
  
@InjectableInit()  
void configureDependencies() => $initGetIt(getIt);