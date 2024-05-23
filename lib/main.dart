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

    if(kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.ogTitle(ogTitle: 'Marketika');
      meta.ogDescription(ogDescription: 'الويب سايت ده هو المكان اللي هيساعدك تتعلم وتقرأ وتتسلى في كل ما يخص الماركتينج أو التسويق بالعربي وبأسلوب سهل وبسيط، وهيكون مرجع ليك في أي وقت لو فعلاً ناوي تدوس في مجال التسويق Marketing وخصوصاً مجال السوشيال ميديا Social Media. الويب سايت هيضم اقسام كتيرة منها: قسم للأدوات اللي هتساعدك في شغلك - قسم خاص بكل منصة Social Media Platform واللي هتعرف من خلالها كل حاجة عن المنصة دي - قسم هيديك كل التركات اللي تخلى بالك منها وتبقى ناجح في المجال ده Social Media Tips & Tricks - قسم هنعرض فيه قصص حقيقة والدروس المستفادة منها - ده غير اننا هنعمل ملفات تقدر تحملها Templates هتساعدك جداً في شغلك وتختصر وقت كبير. كل الأقسام دي ومش هننسى اننا محتاجين كمان ندردش سوا عشان لو حد حابب يشارك حاجة او يسأل واحنا هنجاوبه.');
      meta.description(description: 'الويب سايت ده هو المكان اللي هيساعدك تتعلم وتقرأ وتتسلى في كل ما يخص الماركتينج أو التسويق بالعربي وبأسلوب سهل وبسيط، وهيكون مرجع ليك في أي وقت لو فعلاً ناوي تدوس في مجال التسويق Marketing وخصوصاً مجال السوشيال ميديا Social Media. الويب سايت هيضم اقسام كتيرة منها: قسم للأدوات اللي هتساعدك في شغلك - قسم خاص بكل منصة Social Media Platform واللي هتعرف من خلالها كل حاجة عن المنصة دي - قسم هيديك كل التركات اللي تخلى بالك منها وتبقى ناجح في المجال ده Social Media Tips & Tricks - قسم هنعرض فيه قصص حقيقة والدروس المستفادة منها - ده غير اننا هنعمل ملفات تقدر تحملها Templates هتساعدك جداً في شغلك وتختصر وقت كبير. كل الأقسام دي ومش هننسى اننا محتاجين كمان ندردش سوا عشان لو حد حابب يشارك حاجة او يسأل واحنا هنجاوبه.');
      meta.keywords(keywords: 'كتابة إعلانات, كتابة محتوى, عبارات تسويقية ناجحة, ماركتينج بالمصري, ماركتينج بالعربي, التسويق, تعلم التسويق الرقمي, التشويق الرقمي, قصص في التسويق, ادوات التسويق, مقالات في التسويق, مقالات السوشيال ميديا, محتوى سوشيال ميديا, التسويق بالعربي, التسويق بالمصري, ماركتيكا, Social media, Social media content, Content creation, Social media specialist, Social media marketing, Social media in arabic, Marketing in arabic, Social media blog, Marketing blog, Social media tools, Social media tips & tricks, Social media updates, Marketika, Social media in egypt, Marketing in egypt, Digital marketing, Social media articles, Social media case studies, Social media ads, Social media seo, Google seo, Social media advertising, Free social media course, Free social media tools');
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
