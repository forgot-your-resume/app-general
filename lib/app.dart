import 'package:forgot_your_resume/core/data/dio/api_endpoints.dart';
import 'package:forgot_your_resume/dependency_injection/app_component.dart';
import 'package:forgot_your_resume/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.page,
    required this.beautyverseEndpoints,
  });

  final Widget page;
  final ApiEndpoints beautyverseEndpoints;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    configureDependencies(
      widget.beautyverseEndpoints,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: invalid_use_of_protected_member
      navigatorKey: AppNavigator.navigatorKey,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Barlow',
        scaffoldBackgroundColor: Colors.white,
      ),
      scrollBehavior: const CustomScrollBehaviour(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      navigatorObservers: [
        // getIt<FirebaseAnalyticsObserver>(),
      ],
      home: widget.page,
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  const CustomScrollBehaviour();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const AlwaysScrollableScrollPhysics(
      parent: BouncingScrollPhysics(),
    );
  }
}
