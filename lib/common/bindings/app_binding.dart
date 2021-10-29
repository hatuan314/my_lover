import 'package:get/get.dart';
import 'package:my_lover/presentation/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(FirebaseConfig());
    // Get.put(HiveConfig());
    Get.put(AppController());
    // Get.put(ProfileController());
    // Get.put<AuthenticationDataSource>(AuthenticationDataSource());
    // Get.put<AuthenticationRepository>(
    //     AuthenticationRepositoryImpl(Get.find<AuthenticationDataSource>()));
    // Get.put<AuthenticationUsecase>(
    //     AuthenticationUsecase(Get.find<AuthenticationRepository>()));
    // Get.put<UserRemoteDataSourece>(
    //     UserRemoteDataSourece(Get.find<FirebaseConfig>()));
    // Get.put(UserLocalDataSource(Get.find<HiveConfig>()));
    // Get.put<UserRepository>(UserRepositoryImpl(
    //     Get.find<UserRemoteDataSourece>(), Get.find<UserLocalDataSource>()));
    // Get.put<UserUsecase>(UserUsecase(Get.find<UserRepository>()));
  }
}
