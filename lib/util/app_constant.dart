import 'package:tutorial/data/model/response/language_model.dart';

class AppConstant{
  // API BASE URL
  static const String BASE_URL = '';

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: 'Images.united_kindom', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: 'Images.arabic', languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

}