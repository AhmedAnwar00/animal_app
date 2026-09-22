import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/core/storage/token_storage.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/features/connectivity/controller/connectivity_controller.dart';
import 'package:animal_app/features/connectivity/ui/no_internet_connection_page.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _connectivityController = ConnectivityController();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final hasSession = await TokenStorage().hasTokens();
    if (!mounted) return;
    _initialRoute = hasSession ? AppRoutes.home : AppRoutes.login;
    FlutterNativeSplash.remove();
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _connectivityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const SizedBox.shrink();
    }

    return MaterialApp(
      title: 'Animoo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        useMaterial3: true,
      ),
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: _initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: (context, child) {
        return ListenableBuilder(
          listenable: _connectivityController,
          builder: (context, _) {
            return Stack(
              children: [
                ?child,
                if (!_connectivityController.isConnected)
                  const Positioned.fill(
                    child: NoInternetConnectionPage(),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
