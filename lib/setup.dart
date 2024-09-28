part of 'main.dart';

/// Bootstrap the app with the given builder function
Future<void> setup(FutureOr<Widget> Function() builder) async {
  /// Run the app in a zone to catch all errors and log them to the console
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    systemUIModeConfiguration();

    await dotenv.load(fileName: ".env");

    configureDependencies();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
    );

    Bloc.observer = const AppBlocObserver();

    runApp(await builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack, name: 'setup');
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
  });

  /// Log all errors to the console
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };
}

Future<void> systemUIModeConfiguration() async {
  try {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // set Status bar icons color in Android devices
        statusBarBrightness: Brightness.dark, // set Status bar icon color in iOS
      ),
    );
  } catch (e) {
    log('di.dart: systemUIModeConfiguration => ${e.toString()}');
  }
}
