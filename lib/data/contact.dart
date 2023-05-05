import 'package:meta/meta.dart';

class Contact {
  String name;
  String email;
  String phone;
  String address;
  bool isFavorite;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.isFavorite = false,
  });
}
