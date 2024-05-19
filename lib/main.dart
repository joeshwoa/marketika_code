import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:marketika_website/pages/home_page/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    MetaSEO().config();
  }

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    f(kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.ogTitle(ogTitle: 'Marketika');
      meta.ogDescription(ogDescription: 'Market');
      meta.description(description: 'Market');
      meta.keywords(keywords: 'Market, Marketing, ADs, Marketika, Marketika Site, Marketika Website, Marketika Web, Marketika Web Site, Marketing Blogs, Marketing Articles');
    }

    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF9279BA),brightness: Brightness.light),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF9279BA),brightness: Brightness.dark),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Marketika',
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }
}
