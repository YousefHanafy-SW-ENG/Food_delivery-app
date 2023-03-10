import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/routes/route_helper.dart';
import 'package:shopapp/utils/dimensions.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void>_loadResources() async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  void initState(){
    super.initState();
    _loadResources();
    controller = new AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();

    animation =  CurvedAnimation(parent: controller,
        curve: Curves.linear);

    Timer(
      const Duration(seconds: 3 ),
      ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("assets/image/logo1.jpg",width: Dimensions.splashImg*1.4,))),
          SizedBox(height: 5,),
          Center(
              child: Image.asset("assets/image/foodlogo1.png",width: Dimensions.splashImg*1.2,))
        ],
      ),
    );
  }
}
