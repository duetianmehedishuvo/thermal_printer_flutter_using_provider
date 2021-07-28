import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/data/model/response/config_model.dart';
import 'package:tutorial/data/repository/splash_repo.dart';
import 'package:intl/intl.dart';

class SplashProvider with ChangeNotifier {
  final SplashRepo splashRepo;

  SplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  BaseUrls _baseUrls;
  DateTime _currentTime = DateTime.now();
  DateTime get currentTime => _currentTime;

  ConfigModel get configModel => _configModel;

  BaseUrls get baseUrls => _baseUrls;

  Future<bool> initConfig(GlobalKey<ScaffoldState> globalKey) async {
    ApiResponse apiResponse = await splashRepo.getConfig();
    bool isSuccess;
    if (apiResponse.response != null && (apiResponse.response.statusCode == 200 || apiResponse.response.statusCode == 201)) {
      _configModel = ConfigModel.fromJson(apiResponse.response.data);
      _baseUrls = ConfigModel.fromJson(apiResponse.response.data).baseUrls;
      isSuccess = true;
      print(_configModel.toJson());
      notifyListeners();
    } else {
      isSuccess = false;
      String _error;
      if (apiResponse.error is String) {
        _error = apiResponse.error;
      } else {
        _error = apiResponse.error.errors[0].message;
      }
      globalKey.currentState.showSnackBar(SnackBar(content: Text(_error), backgroundColor: Colors.red));
    }
    return isSuccess;
  }

  bool isRestaurantClosed() {
    DateTime _open = DateFormat('hh:mm').parse(_configModel.restaurantOpenTime);
    DateTime _close = DateFormat('hh:mm').parse(_configModel.restaurantCloseTime);
    DateTime _openTime = DateTime(_currentTime.year, _currentTime.month, _currentTime.day, _open.hour, _open.minute);
    DateTime _closeTime = DateTime(_currentTime.year, _currentTime.month, _currentTime.day, _close.hour, _close.minute);
    if(_closeTime.isBefore(_openTime)) {
      _closeTime = _closeTime.add(Duration(days: 1));
    }
    if(_currentTime.isAfter(_openTime) && _currentTime.isBefore(_closeTime)) {
      return false;
    }else {
      return true;
    }
  }
}
