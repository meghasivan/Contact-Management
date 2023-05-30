import 'package:contact_management/data/contact_repository.dart';
import 'package:contact_management/domain/use_cases/contact_use_case_impl.dart';
import 'package:contact_management/utils/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contact_management/domain/entities/contact.dart';
import 'package:contact_management/domain/use_cases/contact_use_case.dart';
import 'package:contact_management/shared/widgets/contact_list_item.dart';

final TextEditingController _searchController = TextEditingController();
String filter = "";

final contactUseCaseProvider = Provider<ContactUseCase>((ref) {
  return ContactUseCaseImpl(ContactRepositoryImpl());
});

final contactsProvider = FutureProvider<List<Contact>>((ref) async {
  final contactUseCase = ref.watch(contactUseCaseProvider);

  await contactUseCase.getContacts(_searchController.text, filter);
  return contactUseCase.toShow;
});

final searchProvider = StateNotifierProvider<SearchNotifier, bool>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<bool> {
  SearchNotifier() : super(false);

  void toggleSearch() {
    state = !state;
  }
}

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsyncValue = ref.watch(contactsProvider);
    final isSearching = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                ref.read(darkModeProvider.notifier).toggle();
              },
              child: Image.asset('assets/images/logo.png')),
          title: const Text("Contacts"),
          actions: [
            IconButton(
              icon: Icon(
                isSearching ? Icons.close : Icons.search,
                size: 20,
              ),
              onPressed: () {
                if (isSearching) {
                  _searchController.clear();
                }
                ref
                    .read(searchProvider.notifier)
                    .toggleSearch(); // Update the search state
              },
            ),
          ]),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: contactsAsyncValue.when(
          data: (contacts) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(
                        right: 30, top: isSearching ? 20 : 0, bottom: 15),
                    padding: const EdgeInsets.only(left: 15),
                    duration: const Duration(milliseconds: 600),
                    width: isSearching
                        ? MediaQuery.of(context).size.width * 0.45
                        : 0,
                    height: isSearching ? 50 : 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.orange[800]!)),
                    child: TextField(
                        cursorColor: Colors.orange[800],
                        controller: _searchController,
                        onChanged: (val) {
                          //ref.refresh(contactsProvider);
                          ref.invalidate(contactsProvider);
                        },
                        decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 255, 250, 244),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            hintText: 'Search here',
                            hintStyle: TextStyle(color: Colors.orange[800]),
                            prefixIcon: isSearching
                                ? Icon(
                                    Icons.search,
                                    color: Colors.orange[800],
                                    size: 20,
                                  )
                                : null,
                            border: InputBorder.none)),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          filter = "";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter = ".org";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            ".ORG",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter = ".info";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            ".INFO",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter = ".net";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            ".NET",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter = ".com";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            ".COM",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter = ".biz";
                          ref.invalidate(contactsProvider);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            ".BIZ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 100,
                        crossAxisCount: MediaQuery.of(context)
                                    .size
                                    .shortestSide <
                                600
                            ? 1
                            : MediaQuery.of(context).size.shortestSide < 1200
                                ? 2
                                : 4),
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return ContactListItem(
                        contact: contact,
                        index: contact.id,
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => _errorWidget(),
        ),
      ),
    );
  }

  Widget _errorWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Something went Wrong',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Retry"))
          ],
        ),
      ),
    );
  }
}
