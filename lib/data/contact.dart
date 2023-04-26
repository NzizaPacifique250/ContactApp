import 'package:meta/meta.dart';

class Contact {
  String name;
  String emial;
  String phone;
  bool isFavorite;

  Contact({
    required this.name,
    required this.emial,
    required this.phone,
    this.isFavorite = false,
  });
}
