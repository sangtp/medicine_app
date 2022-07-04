import 'dart:core';

Map<String, String> _vi = {};
Map<String, String> _en = {
  "generalSettings": "General Setting",
  "updateApp": "Update App",
  "privacyPolicy": "Privacy Policy",
  "termsOfService": "Terms of Service",
  "contactUs": "Contact Us",
  "help": "Help",
};
String currentLanguage = "vi";
String lang(String key, String defaultString) {
  if (currentLanguage == "en") return _en[key] ?? defaultString;
  return _vi[key] ?? defaultString;
}
