import 'package:get_it/get_it.dart';
import 'package:nfc_demo/website/services/api.dart';
import 'package:nfc_demo/website/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Api());
}