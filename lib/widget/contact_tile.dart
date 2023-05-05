import 'package:contact_app/data/contact.dart';
import 'package:contact_app/user-interface/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    required this.contactIndex,
  });

  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
      return ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/21378$contactIndex/pexels-photo-21378$contactIndex.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
        title: Text(model.contacts[contactIndex].name),
        subtitle: Text(model.contacts[contactIndex].email),
        trailing: IconButton(
          icon: Icon(
              model.contacts[contactIndex].isFavorite
                  ? Icons.star
                  : Icons.star_border,
              color: model.contacts[contactIndex].isFavorite
                  ? Colors.amber
                  : Colors.grey),
          onPressed: () {
            model.changeFavoriteStatus(contactIndex);
          },
        ),
      );
    });
  }
}
