import 'package:contact_app/contact/widget/create_contact_form.dart';
import 'package:flutter/material.dart';

class CreateContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Create Contact')),
        leading: BackButton(),
      ),
      body: CreateForm(),
    );
  }
}
