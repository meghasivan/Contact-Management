import 'dart:convert';

import 'package:contact_management/domain/entities/contact.dart';
import 'package:contact_management/domain/repositories/contact_repository.dart';
import 'package:http/http.dart' as http;

class ContactRepositoryImpl implements ContactRepository {
  @override
  List<Contact> listOfContacts = [];
  @override
  List<Contact> toShow = [];

  @override
  Future<void> addContact(Contact contact) {
    // TODO: implement addContact
    throw UnimplementedError();
  }

  @override
  Future<void> deleteContact(Contact contact) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  // @override
  // Future<List<Contact>> getContacts() async {
  //   return <Contact>[
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //     const Contact(id: "id", name: "name", phoneNumber: "phoneNumber"),
  //   ];
  // }

  @override
  Future<List<Contact>> getContacts(String data, String filter) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      listOfContacts.clear();
      toShow.clear();
      var responseList = jsonDecode(response.body);
      for (var element in responseList) {
        listOfContacts.add(Contact(
            id: element["id"],
            name: element["name"],
            username: element["username"],
            email: element["email"],
            phoneNumber: element["phone"],
            website: element["website"],
            address: element["address"],
            company: element["company"]));
      }

      listOfContacts.forEach((element) {
        if (element.name.contains(data) && element.website.contains(filter)) {
          toShow.add(element);
        }
      });

      return listOfContacts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Future<void> updateContact(Contact contact) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
  // Implement the necessary CRUD operations using a database (e.g., SQLite or Firebase).
}
