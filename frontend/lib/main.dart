import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/provider/router_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
