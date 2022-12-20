import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:updater/providers/auth_provider.dart';
import 'package:updater/screens/sign_in_screen.dart';
import 'package:updater/view/customer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

final firebaseinitializer = FutureProvider((ref) async {
  await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializer);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: initialize.when(data: (date) {
        return AuthChecker();
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, error: (error, stack) {
        return const Center(
          child: Text('Error'),
        );
      }),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AuthChecker extends ConsumerWidget {
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
      data: (user) {
        if (user != null) {
          return const CustomerScreen();
        } else {
          return const SignInScreen();
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => const Center(
        child: Text(
          'Something went wrong',
        ),
      ),
    );
  }
}
