import 'package:contact_app/contact/create_contact_page.dart';
import 'package:contact_app/user-interface/model/contact_model.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../data/contact.dart';
import '../../widget/contact_tile.dart';

class ContactsListPage extends StatefulWidget {
  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
          return ListView.builder(
            itemCount: model.contacts.length,
            itemBuilder: (context, index) {
              return ContactTile(contactIndex: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add),
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateContactPage()))),
    );
  }
}
