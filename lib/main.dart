import 'package:kpop_application/export.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
        Provider<ApiService>(create: (context) => ApiService()),
        Provider<GroupsRepository>(
          create: (context) => GroupRepositoryImpl(context.read<ApiService>()),
        ),
        BlocProvider<GroupsBloc>(
          create: (context) => GroupsBloc(context.read<GroupsRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemesProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/groups_page': (context) => GroupsPage(),
        '/members_page': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return MembersPage(
            group: args['group'],
            idols: args['idols'],
            // Передаем группы
          );
        },
        '/idols_page': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return IdolsPage(
            memberId: args['memberId'],
            idols: args['idols'],
            group: args['group'],
          );
        },
      },
    );
  }
}
