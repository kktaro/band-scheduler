import 'package:band_scheduler/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BandSchedulerApp extends ConsumerStatefulWidget {
  const BandSchedulerApp({super.key});

  @override
  ConsumerState<BandSchedulerApp> createState() => _BandSchedulerAppState();
}

class _BandSchedulerAppState extends ConsumerState<BandSchedulerApp> {
  late final GoRouter _router = createRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'band-scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      routerConfig: _router,
    );
  }
}
