import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:theblue_crown/data/repository/location_repo.dart';
import 'package:theblue_crown/models/response_model.dart';
import '../data/api/api_checker.dart';
import '../pages/address/widgets/location_service.dart';
import '../models/address_model.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController implements GetxService{

  LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _loading = false;
  bool get loading => _loading;

  late Position _position;
  Position get position => _position;

  late Position _pickPosition;
  Position get pickPosition => _pickPosition;

  Placemark _placeMark = Placemark();
  Placemark get placeMark => _placeMark;

  Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList;
  List<AddressModel> get allAddressList => _allAddressList;

  final List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;

  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  // for service zone
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // whether the is in service zone or not
  bool _inZone = false;
  bool get inZone => _inZone;

  // showing and hiding the button as the map loads
  bool _buttonDisabled = true;
  bool get buttonDisabled => _buttonDisabled;

  //save the google map suggestion for address
  List<Prediction> _predictionList = [];

  bool _updateAddAddressData = true;
  bool _changeAddress = true;

  // Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
  //   if(text != null && text.isNotEmpty) {
  //     http.Response response = await getLocationData(text);
  //     var data = jsonDecode(response.body.toString());
  //     print("my status is "+data["status"]);
  //     if ( data['status']== 'OK') {
  //       _predictionList = [];
  //       data['predictions'].forEach((prediction)
  //       => _predictionList.add(Prediction.fromJson(prediction)));
  //     } else {
  //       // ApiChecker.checkApi(response);
  //     }
  //   }
  //   return _predictionList;
  // }

  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    if(text.isNotEmpty) {
      Response response = await locationRepo.searchLocation(text);
      if (response.statusCode == 200 && response.body['status']== 'OK') {
        _predictionList = [];
        response.body['predictions'].forEach((prediction)
        => _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  setLocation(String placeID, String address, GoogleMapController mapController) async {
    _loading = true;
    update();
    PlacesDetailsResponse detail;
    Response response = await locationRepo.setLocation(placeID);
    detail = PlacesDetailsResponse.fromJson(response.body);
    _pickPosition = Position(
      latitude: detail.result.geometry!.location.lat,
      longitude: detail.result.geometry!.location.lng,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      heading: 1,
      speed: 1,
      speedAccuracy: 1,
    );
    _pickPlaceMark = Placemark(name: address);
    _changeAddress = false;
    if(!mapController.isNull){
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(
            detail.result.geometry!.location.lat,
            detail.result.geometry!.location.lng,
          ), zoom: 17)
      ));
    }
    _loading = false;
    update();
  }

  Future<void> getCurrentLocation(bool fromAddress,
  {required GoogleMapController mapController,
    LatLng? defaultLatLng, bool notify = true}) async {
    _loading = true;
    if(notify){
      update();
    }
    AddressModel _addressModel;
    late Position _myPosition;
    Position _test;
  }

  void setMapController(GoogleMapController mapController){
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if(_updateAddAddressData){
      _loading = true;
      update();
      try{
        if(fromAddress){
          _position = Position(
            latitude: position.target.latitude, longitude: position.target.longitude, timestamp: DateTime.now(),
            heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1,
          );
        } else {
          _pickPosition = Position(
            latitude: position.target.latitude, longitude: position.target.longitude, timestamp: DateTime.now(),
            heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1,
          );
        }
        ResponseModel _responseModel = await getZone(position.target.latitude.toString(), position.target.longitude.toString(), true);
        // if button value is false we are in the service area
        _buttonDisabled = !_responseModel.isSuccess;
        if(_changeAddress){
          String _address = await getAddressFromGeocode(LatLng(position.target.latitude, position.target.longitude,),);
          print("my address is : $_address");
          fromAddress ? _placeMark = Placemark(name: _address) : _pickPlaceMark = Placemark(name: _address);
        } else {_changeAddress = true;}
      } catch(e) {
        print(e);
      }
      _loading = false;
      update();
    }else{_updateAddAddressData = true;}
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String _address = "Unknown_Location_Found".tr;
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if(response.body['status'] == 'OK'){
      _address = response.body['results'][0]['formatted_address'].toString();
      print("////////////////////////////////////////////////////    printing address    ////////////////////////////////////////////////// " + _address);
    }else{
      print("Error getting the google api");
    }
    // update();
    return _address;
  }

  late Map<String, dynamic> _getAddress;
  // Map get getAddress => _getAddress;
  Map<String, dynamic> get getAddress => _getAddress;

  AddressModel getUserAddress(){
    late AddressModel _addressModel;

    //converting to map using jsonDecode
    _getAddress = jsonDecode(locationRepo.getUserAddress());

    try{
      _addressModel = AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
      print("55555555555555555555555555555555555555555555555555555555555555");
    }catch(e){
      print(e);
    }

    return _addressModel;
  }

  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode == 200) {
      await getAddressList();
      String message = response.body["message"];
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);
    }else{
      print("couldn't save the address" + response.statusText!);
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();
    if(response.statusCode == 200){
      _addressList = [];
      _allAddressList = [];
      response.body.forEach((address){
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
      print("........added........" + _addressList.toString());
    }else{
      _addressList = [];
      _allAddressList = [];
      print("........not added........");
    }
    update();
  }

  Future<bool> saveUserAddress(AddressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  void clearAddressList(){
    _addressList = [];
    _allAddressList = [];
    update();
  }

  String getUserAddressFromLocalStorage(){
    return locationRepo.getUserAddress();
  }

  void setAddAddressData(){
    _position = _pickPosition;
    _placeMark = _pickPlaceMark;
    _updateAddAddressData = false;
    update();
  }

  Future<ResponseModel> getZone(String lat, String lng, bool markerLoad) async {
    late ResponseModel _responseModel;
    if(markerLoad){
      _loading = true;
    }else{
      _isLoading = true;
    }
    update();
    Response response = await locationRepo.getZone(lat, lng);
    if(response.statusCode == 200){
      _inZone = true;
      _responseModel = ResponseModel(true, response.body["zone_id"].toString());
    }else{
      _inZone = false;
      _responseModel = ResponseModel(true, response.statusText!);
    }
    if(markerLoad){
      _loading = false;
    }else{
      _isLoading = false;
    }
    // for debugging
    print("zone response code is " + response.statusCode.toString());
    update();
    return _responseModel;
  }
}