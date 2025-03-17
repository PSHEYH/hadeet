import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hadeet/routes.dart';
import 'package:hadeet/ui/splash/splash_screen.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:hadeet/widgets/dismiss_keyboard.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = const WeatherBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => DismissKeyboard(child: child),
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
        ),
        initialRoute: SplashScreen.route().settings.name,
        routes: routes,
      ),
    );
  }
}
