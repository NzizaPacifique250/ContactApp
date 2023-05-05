import 'package:faker/faker.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../data/contact.dart';

class ContactModel extends Model {
  //(_)underscore act like private access
  List<Contact> _contacts = List.generate(
      5,
      (index) => Contact(
            name: faker.address.city(),
            email: faker.animal.name(),
            phone: faker.randomGenerator.integer(12).toString(),
            address: faker.company.name(),
            isFavorite: false,
          ));
  // helps to avoid that it is not overwritten in different classes(get only properties)
  List<Contact> get contacts => _contacts;
  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void changeFavoriteStatus(int index) {
    _contacts[index].isFavorite = !_contacts[index].isFavorite;
    _contacts.sort((a, b) {
      if (a.isFavorite) {
        // This mean that the first selected item will be ahead of the all items
        return -1;
      } else if (b.isFavorite) {
        // This mean that the new selected item will be below of the selected one
        return 1;
      } else {
        // This mean that if none selected it will remain the same
        return 0;
      }
    });
    notifyListeners();
  }
}
