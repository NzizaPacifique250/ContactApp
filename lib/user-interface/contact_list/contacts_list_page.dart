import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../../data/contact.dart';
import '../../widget/contact_tile.dart';

class ContactsListPage extends StatefulWidget {
  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late List<Contact> _contacts;
  @override
  void initState() {
    super.initState();
    _contacts = List.generate(
        5,
        (index) => Contact(
              name: faker.person.firstName() + ' ' + faker.person.lastName(),
              emial: faker.internet.freeEmail(),
              phone: faker.lorem.word(),
              isFavorite: false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (context, index) {
              return ContactTile(
                contact: _contacts[index],
                onIsFavoritePressed: () {
                  setState(() {
                    _contacts[index].isFavorite = !_contacts[index].isFavorite;
                    _contacts.sort(
                      (a, b) {
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
                      },
                    );
                  });
                },
              );
            }));
  }
}
