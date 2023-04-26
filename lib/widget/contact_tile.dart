import 'package:contact_app/data/contact.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    required this.contact,
    required this.onIsFavoritePressed,
  });

  final Contact contact;

  final void Function() onIsFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.emial),
      trailing: IconButton(
        icon: Icon(contact.isFavorite ? Icons.star : Icons.star_border,
            color: contact.isFavorite ? Colors.amber : Colors.grey),
        onPressed: onIsFavoritePressed,
      ),
    );
  }
}
