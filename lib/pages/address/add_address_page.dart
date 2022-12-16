import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:theblue_crown/base/custom_app_bar.dart';
import 'package:theblue_crown/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:theblue_crown/controllers/location_controller.dart';
import 'package:theblue_crown/controllers/user_controller.dart';
import 'package:theblue_crown/models/address_model.dart';
import 'package:theblue_crown/pages/address/pick_address_map.dart';
import 'package:theblue_crown/routes/route_helper.dart';
import 'package:theblue_crown/utils/dimensions.dart';
import 'package:theblue_crown/widgets/app_text_field.dart';
import 'package:theblue_crown/widgets/custom_big_text.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  TextEditingController _addressController = TextEditingController();
  var _contactPersonNameController = TextEditingController();
  var _contactPersonNumberController = TextEditingController();
  late bool _isLoggedIn;
  CameraPosition _cameraPosition = CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 17);
  late LatLng _initialPosition;// = LatLng(45.51563, -122.677433,);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_isLoggedIn && Get.find<UserController>().userInfoModel == null){     Get.find<UserController>().getUserInfo();    }
    if(Get.find<LocationController>().addressList.isEmpty){
      _initialPosition = LatLng(45.521563, -122.677433,);
    } else {
      if(Get.find<LocationController>().getUserAddress().address.isNotEmpty){

        print("My address is " + Get.find<LocationController>().getUserAddress().address);
        print("Lat is " + Get.find<LocationController>().getAddress["latitude"].toString());

        _cameraPosition = CameraPosition(
          target: LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(Get.find<LocationController>().getAddress["longitude"]),
          ),
        );
        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        );
      }
    }
      // if(Get.find<LocationController>().getUserAddressFromLocalStorage() == ""){
      //   Get.find<LocationController>().saveUserAddress(Get.find<LocationController>().addressList.last);
      // }
    }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.toNamed(RouteHelper.getInitial());
        return true;
      },
      child: GestureDetector(
        // onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: CustomAppBar(title: "Address_Page".tr,),


          body: GetBuilder<UserController>(builder: (userController){
            // if(userController.userInfoModel!=null&&_contactPersonNameController.text.isEmpty){
              _contactPersonNameController.text = '${userController.userInfoModel?.fName}';
              _contactPersonNumberController.text = '${userController.userInfoModel?.phone}';
              if(Get.find<LocationController>().addressList.isNotEmpty){
               _addressController.text = Get.find<LocationController>().getUserAddress().address;
               print("address from database : " + _addressController.text);
              // }
            }
            return GetBuilder<LocationController>(builder: (locationController) {
              _addressController.text =
                  '${locationController.placeMark.name ?? ''}'
                  '${locationController.placeMark.locality ?? ''}'
                  '${locationController.placeMark.postalCode ?? ''}'
                  '${locationController.placeMark.country ?? ''}';
              print("address in my view is " + _addressController.text.toString());
              print("I am getting from placeMark.name :  " + '${locationController.placeMark.name}');
              print("I am getting from placeMark.locality :  " + '${locationController.placeMark.locality}');
              print("I am getting from placeMark.postalCode :  " + '${locationController.placeMark.postalCode}');
              print("I am getting from placeMark.country :  " + '${locationController.placeMark.country}');


              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimensions.height45 * 4,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(Dimensions.height10 / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15 / 3),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      child: Stack(
                        children: [
                          GoogleMap(initialCameraPosition:
                          CameraPosition(target: _initialPosition, zoom: 17),
                            onTap: (latLng){
                            Get.toNamed(
                                RouteHelper.getPickAddressPage(),
                                arguments: PickAddressMap(
                                  fromAddAddress: true,
                                  fromSignup: false,
                                  googleMapController: locationController.mapController,
                                  canRoute: false,
                                  route: "",
                                ),);},
                            zoomControlsEnabled: false,
                            compassEnabled: false,
                            indoorViewEnabled: true,
                            mapToolbarEnabled: false,
                            myLocationEnabled: true,
                            onCameraIdle: () {
                            print("tapping for update");
                            locationController.updatePosition(_cameraPosition, true);
                            },
                            onCameraMove: ((position) {
                              print("...camera move..");
                              _cameraPosition = position;
                            }),
                            onMapCreated: (GoogleMapController controller){
                              print("I am from address page");
                              locationController.setMapController(controller);
                              // if(Get.find<LocationController>().addressList.isEmpty){
                                // locationController.getCurrentLocation(true, mapController: controller);
                              // }
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        top: Dimensions.height20
                      ),
                      child: SizedBox(
                        height: Dimensions.height45,
                        child: ListView.builder(
                          shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: locationController.addressTypeList.length,
                            itemBuilder: (context, index){
                              return InkWell(
                                onTap: (){  locationController.setAddressTypeIndex(index);  },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width20,
                                      vertical: Dimensions.height10,
                                  ),
                                  margin: EdgeInsets.only(right: Dimensions.width10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[200]!,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                      ),
                                    ]
                                  ),
                                  child: Icon(
                                    index == 0 ?
                                    Icons.home_filled :
                                       index == 1 ?
                                           Icons.work :
                                           Icons.location_on,
                                    color: locationController.addressTypeIndex == index ?
                                    Colors.blue :
                                    Theme.of(context).disabledColor,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20),
                      child: CustomBigText(text: "Delivery_Address".tr,),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    AppTextField(
                      textController: _addressController,
                      hintText: "Your_Address".tr,
                      icon: Icons.map,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20, top: Dimensions.height10),
                      child: CustomBigText(text: "Contact_Name".tr,),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    AppTextField(
                      textController: _contactPersonNameController,
                      hintText: "Your_Name",
                      icon: Icons.person,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.width20, left: Dimensions.width20, top: Dimensions.height10),
                      child: CustomBigText(text: "Your_Number".tr,),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    AppTextField(
                      textController: _contactPersonNumberController,
                      hintText: "Your_Number".tr,
                      icon: Icons.phone,
                    ),
                  ],
                ),
              );
            }
            );
          }),
          bottomNavigationBar: GetBuilder<LocationController>(
            builder: (locationController){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: Dimensions.height20 * 7,
                    padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20,),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20 * 2),
                        topRight: Radius.circular(Dimensions.radius20 * 2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            AddressModel _addressModel = AddressModel(
                                addressType: locationController.addressTypeList[locationController.addressTypeIndex],
                              contactPersonName: _contactPersonNameController.text,
                              contactPersonNumber: _contactPersonNumberController.text,
                              address: _addressController.text,
                              latitude: locationController.position.latitude.toString(),
                              longitude: locationController.position.longitude.toString(),
                            );
                            locationController.addAddress(_addressModel).then((response){
                              if(response.isSuccess){
                                Get.toNamed(RouteHelper.getInitial());
                                Get.snackbar("Address".tr, "Added_Successfully".tr);
                              }else{
                                Get.snackbar("Address".tr, "Could_NOt_Save_Address".tr);
                              }
                            });
                          },
                          child: Container (
                            padding: EdgeInsets.only(top: Dimensions.height45 / 2, bottom: Dimensions.height45 / 2, left: Dimensions.width20, right: Dimensions.width20,),
                            child: CustomBigText(
                              text: "Save_Address".tr,
                              size: 26,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
