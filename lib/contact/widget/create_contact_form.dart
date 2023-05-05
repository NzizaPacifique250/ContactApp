import 'package:contact_app/data/contact.dart';
import 'package:contact_app/user-interface/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateForm extends StatefulWidget {
  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formalKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formalKey,
      child: ListView(
        padding: const EdgeInsets.all(100),
        children: <Widget>[
          const SizedBox(height: 10),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.white70, width: 3))),
            validator: (value) {
              // ignore: valid_regexps
              final passRegex = RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');
              if (value != null && value.isEmpty) {
                return "Please enter the Name";
              }
              if (!passRegex.hasMatch(value!)) {
                return 'Invalid Name';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _phone,
            decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.white70, width: 3))),
            validator: (_phone) {
              // ignore: valid_regexps
              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
              RegExp regExp = RegExp(pattern);
              if (_phone != null && _phone.isEmpty) {
                return 'Please enter mobile number';
              } else if (!regExp.hasMatch(_phone!)) {
                return 'Please enter valid mobile number';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.white70, width: 3))),
            validator: (value) {
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (value != null && value.isEmpty) {
                return "Please enter the email";
              }
              if (!emailRegex.hasMatch(value!)) {
                return 'Invalid email';
              }
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _address,
            decoration: const InputDecoration(
                labelText: 'Adress',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.white70, width: 3))),
            validator: (value) {
              // ignore: valid_regexps
              final addressRegex = RegExp(r'[A-Za-z][A-Za-z0-9_]{7,29}$');
              if (value != null && value.isEmpty) {
                return "Please enter the password";
              }
              if (!addressRegex.hasMatch(value!)) {
                return 'Invalid password';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text(
              'SAVE',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: _onSaveContactButtonPressed,
          )
        ],
      ),
    );
  }

  void _onSaveContactButtonPressed() {
    var isValid = _formalKey.currentState!.validate();
    if (isValid == true) {
      _formalKey.currentState?.save();
    }
    final newContact = Contact(
        name: _name.text,
        email: _email.text,
        phone: _phone.text,
        address: _address.text);

    ScopedModel.of<ContactModel>(context).addContact(newContact);
    Navigator.of(context).pop();
  }
}
