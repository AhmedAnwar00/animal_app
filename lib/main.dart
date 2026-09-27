import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/core/storage/token_storage.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/connectivity/controller/connectivity_controller.dart';
import 'package:animal_app/features/connectivity/ui/no_internet_connection_page.dart';
import 'package:animal_app/features/language/controller/language_controller.dart';
import 'package:animal_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _ready = false;
  var _initialRoute = AppRoutes.login;
  late final ConnectivityController _connectivityController;
  late final LanguageController _languageController;

  @override
  void initState() {
    super.initState();
    _connectivityController = ConnectivityController();
    _languageController = LanguageController();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await _languageController.load();
    final tokenStorage = TokenStorage();
    final rememberMe = await tokenStorage.readRememberMe();

    if (!rememberMe) {
      await tokenStorage.clear();
      if (!mounted) return;
      _initialRoute = AppRoutes.login;
    } else {
      final refresh = await tokenStorage.readRefreshToken();
      final hasRefresh = refresh != null && refresh.isNotEmpty;
      if (!mounted) return;
      _initialRoute = hasRefresh ? AppRoutes.home : AppRoutes.login;
    }

    FlutterNativeSplash.remove();
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _languageController.dispose();
    _connectivityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const SizedBox.shrink();
    }

    return ListenableBuilder(
      listenable: _languageController,
      builder: (context, _) {
        return MaterialApp(
          onGenerateTitle: (context) => context.l10n.appTitle,
          locale: _languageController.locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          navigatorKey: AppRouter.navigatorKey,
          initialRoute: _initialRoute,
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
            settings,
            languageController: _languageController,
          ),
          builder: (context, child) {
            return ListenableBuilder(
              listenable: _connectivityController,
              builder: (context, _) {
                return Stack(
                  children: [
                    ?child,
                    if (!_connectivityController.isConnected)
                      const Positioned.fill(child: NoInternetConnectionPage()),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
