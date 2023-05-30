import 'package:flutter/material.dart';
import 'package:contact_management/domain/entities/contact.dart';
import 'package:go_router/go_router.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  final int index;
  const ContactListItem(
      {super.key, required this.contact, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: GestureDetector(
        onTap: () {
          context.go('/details/$index');
        },
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(contact.name),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.phoneNumber),
                const SizedBox(
                  height: 5,
                ),
                Text(contact.website),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              context.go('/details/$index');
              // Implement delete functionality using the ContactUseCase
            },
          ),
        ),
      ),
    );
  }
}
