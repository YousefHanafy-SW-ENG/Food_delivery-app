import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/base/custom_loader.dart';
import 'package:shopapp/controllers/auth_controller.dart';
import 'package:shopapp/controllers/cart_controller.dart';
import 'package:shopapp/controllers/location_controller.dart';
import 'package:shopapp/controllers/user_controller.dart';
import 'package:shopapp/routes/route_helper.dart';
import 'package:shopapp/utils/colors.dart';
import 'package:shopapp/utils/dimensions.dart';
import 'package:shopapp/widgets/account_widget.dart';
import 'package:shopapp/widgets/app_icon.dart';
import 'package:shopapp/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text:"Profile",
              size: 28,
              color: Colors.white,
          ),
        ),
        actions: [Icon(Icons.add,color: AppColors.mainColor,size: 65,)],
      ),
      body: GetBuilder<UserController>(builder: (userController){
        if (_userLoggedIn) {
           if(userController.isLoading){
             return Container(
            margin: EdgeInsets.only(top: Dimensions.height20),
            width: double.maxFinite,
            child: Column(
              children: [
                //profile icon
                AppIcon(icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconsize: Dimensions.height45+Dimensions.height30,
                  size:Dimensions.height15*10,
                ),
                SizedBox(height: Dimensions.height30,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //name
                        AccountWidget(
                          appIcon:  AppIcon(icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10*5/2,
                            size:Dimensions.height10*5,
                          ),
                          bigText: BigText(
                            text:userController.userModel.name,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                        //phone
                        AccountWidget(
                          appIcon:  AppIcon(icon: Icons.phone,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10*5/2,
                            size:Dimensions.height10*5,
                          ),
                          bigText: BigText(
                            text:userController.userModel.phone,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                        //email
                        AccountWidget(
                          appIcon:  AppIcon(icon: Icons.email,
                            backgroundColor: AppColors.yellowColor,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10*5/2,
                            size:Dimensions.height10*5,
                          ),
                          bigText: BigText(
                            text:userController.userModel.email,
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                        //address
                        GetBuilder<LocationController>(builder:(locationController){

                            return GestureDetector(
                              onTap: (){
                                Get.offNamed(RouteHelper.getAddressPage());
                              },
                              child: AccountWidget(
                              appIcon: AppIcon(icon: Icons.location_on,
                                backgroundColor: AppColors.yellowColor,
                                iconColor: Colors.white,
                                iconsize: Dimensions.height10 * 5 / 2,
                                size: Dimensions.height10 * 5,
                              ),
                              bigText: BigText(
                                text: "397 Elnargess buildigs new cairo",
                              ),
                            ),
                            );
                        }),
                        SizedBox(height: Dimensions.height20,),
                        //message
                        AccountWidget(
                          appIcon:  AppIcon(icon: Icons.message,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconsize: Dimensions.height10*5/2,
                            size:Dimensions.height10*5,
                          ),
                          bigText: BigText(
                            text:"Messages",
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                        //message
                        GestureDetector(
                          onTap: (){
                            if(Get.find<AuthController>().userLoggedIn()){
                              Get.find<AuthController>().clearSharedData();
                              Get.find<CartController>().clear();
                              Get.find<CartController>().clearCartHistory();
                              Get.offNamed(RouteHelper.getSignInPage());
                            }
                          },
                          child: AccountWidget(
                            appIcon:  AppIcon(icon: Icons.logout,
                              backgroundColor: Colors.redAccent,
                              iconColor: Colors.white,
                              iconsize: Dimensions.height10*5/2,
                              size:Dimensions.height10*5,
                            ),
                            bigText: BigText(
                              text:"Logout",
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );}
           else {
              return CustomLoader();
            }
        } else {
          return Container(child: Center(child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.maxFinite,
                  height: Dimensions.height20*11,
                  margin: EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/image/sign_in.png"
                        )
                    ),
                  ),
                  child: Text("")),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getSignInPage());
                },
                child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height20*5,
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Center(child: BigText(text: "Sign in",color: Colors.white,size: Dimensions.font20*2.2,))),
              ),
            ],
          ) ));
        }
      }),
    );
  }
}
