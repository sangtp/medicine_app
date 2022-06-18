import 'package:flutter/foundation.dart';

class User {
  final String? imageUrl;
  final String? name;
  final String? email;
  final String? about;
  final bool? isDarkMode;

  const User({
    @required this.imageUrl,
    @required this.name,
    @required this.email,
    @required this.about,
    @required this.isDarkMode,
  });
}
