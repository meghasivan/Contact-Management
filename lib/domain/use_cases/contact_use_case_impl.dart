import 'package:contact_management/domain/entities/contact.dart';
import 'package:contact_management/domain/repositories/contact_repository.dart';
import 'package:contact_management/domain/use_cases/contact_use_case.dart';

class ContactUseCaseImpl implements ContactUseCase {
  final ContactRepository repository;
  @override
  List<Contact> listOfContacts = [];
  @override
  List<Contact> toShow = [];

  ContactUseCaseImpl(this.repository);

  @override
  Future<List<Contact>> getContacts(String data, String filter) async {
    await repository.getContacts(data, filter);
    listOfContacts = repository.listOfContacts;
    toShow = repository.toShow;
    return toShow;
  }

  @override
  Future<void> addContact(Contact contact) {
    return repository.addContact(contact);
  }

  @override
  Future<void> updateContact(Contact contact) {
    return repository.updateContact(contact);
  }

  @override
  Future<void> deleteContact(Contact contact) {
    return repository.deleteContact(contact);
  }
}
