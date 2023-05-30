import 'package:contact_management/data/contact_repository.dart';
import 'package:contact_management/domain/entities/contact.dart';
import 'package:contact_management/domain/use_cases/contact_use_case.dart';
import 'package:contact_management/domain/use_cases/contact_use_case_impl.dart';
import 'package:contact_management/utils/dark_mode_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final contactUseCaseProvider = Provider<ContactUseCase>((ref) {
  return ContactUseCaseImpl(ContactRepositoryImpl());
});

final contactsProvider = FutureProvider<List<Contact>>((ref) async {
  final contactUseCase = ref.watch(contactUseCaseProvider);
  return contactUseCase.getContacts("", "");
});

class UserDetailsScreen extends ConsumerWidget {
  late String id;
  final String contactID;

  UserDetailsScreen({super.key, required this.contactID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsyncValue = ref.watch(contactsProvider);
    return Scaffold(
      body: contactsAsyncValue.when(
        data: (contacts) {
          id = contacts
              .indexOf(contacts
                  .where((element) => element.id == int.parse(contactID))
                  .first)
              .toString();
          return SingleChildScrollView(
            child: Container(
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.back,
                          size: 28,
                          color: Colors.orange[800],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: ref.watch(darkModeProvider)
                      ? Colors.black26
                      : const Color.fromARGB(255, 255, 250, 244),
                  child: Icon(
                    CupertinoIcons.person_crop_circle,
                    size: 100,
                    color: Colors.orange[800],
                  ),
                ),
                Text(
                  contacts[int.parse(id)].username,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                nameWidget(contacts[int.parse(id)].name),
                const SizedBox(
                  height: 14,
                ),
                userData(contacts[int.parse(id)].phoneNumber, 'Phone  :  '),
                const SizedBox(
                  height: 6,
                ),
                userData(contacts[int.parse(id)].email, 'Email  :  '),
                const SizedBox(
                  height: 36,
                ),
                headingWidget('Website Address'),
                const SizedBox(
                  height: 8,
                ),
                subData(contacts[int.parse(id)].website),
                const SizedBox(
                  height: 36,
                ),
                headingWidget('Company Details'),
                const SizedBox(
                  height: 8,
                ),
                subData(contacts[int.parse(id)].company['name'] +
                    '\n' +
                    contacts[int.parse(id)].company['catchPhrase'] +
                    '\n' +
                    contacts[int.parse(id)].company['bs']),
                const SizedBox(
                  height: 36,
                ),
                headingWidget('Home Address'),
                const SizedBox(
                  height: 8,
                ),
                subData(contacts[int.parse(id)].address['street'] +
                    '\n' +
                    contacts[int.parse(id)].address['suite'] +
                    '\n' +
                    contacts[int.parse(id)].address['city'] +
                    '\n' +
                    contacts[int.parse(id)].address['zipcode']),
              ]),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }

  Padding subData(webaddress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          textWidget(webaddress),
        ],
      ),
    );
  }

  Padding headingWidget(heading) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          boldHeading(heading),
        ],
      ),
    );
  }

  Padding nameWidget(name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Name  :  ',
            style: TextStyle(fontSize: 18),
          ),
          boldText(name),
        ],
      ),
    );
  }

  Padding userData(data, label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
          textWidget(data),
        ],
      ),
    );
  }

  Text boldText(name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Text boldHeading(name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Text textWidget(text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}
