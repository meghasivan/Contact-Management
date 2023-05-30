import 'package:contact_management/routes/app_routes.dart';
import 'package:contact_management/utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/dark_mode_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      title: 'Contact Management App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
