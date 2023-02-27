import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopapp/controllers/auth_controller.dart';
import 'package:shopapp/controllers/cart_controller.dart';
import 'package:shopapp/controllers/location_controller.dart';
import 'package:shopapp/controllers/popular_product_controller.dart';
import 'package:shopapp/data/api/api_client.dart';
import 'package:shopapp/data/repository/auth_repo.dart';
import 'package:shopapp/data/repository/cart_repo.dart';
import 'package:shopapp/data/repository/location_repo.dart';
import 'package:shopapp/data/repository/popular_product_repo.dart';
import 'package:shopapp/utils/app_constants.dart';
import '../controllers/recommended_product_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import '../data/repository/user_repo.dart';

Future<void> init()async{

   final sharedPreferences = await SharedPreferences.getInstance();

   Get.lazyPut(() => sharedPreferences);
   //api cLient
   Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL,sharedPreferences:Get.find()));
   Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
   Get.lazyPut(() => UserRepo(apiClient: Get.find()));
   //repos
   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
   Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
   Get.lazyPut(()=>CartRepo(sharedPreferences:Get.find()));
   Get.lazyPut(()=> LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

   //controllers
   Get.lazyPut(() => AuthController(authRepo: Get.find()));
   Get.lazyPut(() => UserController(userRepo: Get.find()));
   Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
   Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find()));
   Get.lazyPut(() => CartController(cartRepo: Get.find()));
   Get.lazyPut(() => LocationController(locationRepo:Get.find()));
}