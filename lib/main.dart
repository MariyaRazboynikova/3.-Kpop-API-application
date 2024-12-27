import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpop_application/core/themes/themes_provider.dart';
import 'package:kpop_application/features/data/api/api_service.dart';
import 'package:kpop_application/features/data/repository/group_repository_impl.dart';
import 'package:kpop_application/features/domain/repository/groups_repository.dart';
import 'package:kpop_application/features/presentaion/bloc/groups_bloc.dart';
import 'package:kpop_application/features/presentaion/pages/groups_page.dart';
import 'package:kpop_application/features/presentaion/pages/idols_page.dart';
import 'package:kpop_application/features/presentaion/pages/intro_page.dart';
import 'package:kpop_application/features/presentaion/pages/members_page.dart';
import 'package:provider/provider.dart';

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
        '/groups_page': (context) => const GroupsPage(),
        '/members_page': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return MembersPage(group: args['group'], idols: args['idols']);
        },
        '/idols_page': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return IdolsPage(memberId: args['memberId'], idols: args['idols']);
        },
      },
    );
  }
}
