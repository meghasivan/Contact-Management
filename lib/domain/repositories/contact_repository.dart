import 'package:contact_management/domain/entities/contact.dart';

abstract class ContactRepository {
  List<Contact> listOfContacts = [];
  List<Contact> toShow = [];

  Future<List<Contact>> getContacts(String data, String filter);
  Future<void> addContact(Contact contact);
  Future<void> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
}
