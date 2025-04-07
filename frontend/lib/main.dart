import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dto/UserConfigurationDTO.dart';
import 'package:untitled/enum/NavBarTabType.dart';
import 'package:untitled/mainService.dart';
import 'package:untitled/screens/chat.dart';
import 'package:untitled/screens/chatInputTransaction.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/insight.dart';
import 'package:untitled/screens/reports.dart';
import 'package:untitled/screens/settings.dart';
import 'package:untitled/utils/DateTimeUtils.dart';
import 'package:untitled/widgets/navbar/navBar.dart';
import 'package:animations/animations.dart';

import 'GlobalConfig.dart';
import 'api/ApiClient.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Dark icons for contrast
      systemNavigationBarColor: Colors.white, // White navigation bar
      systemNavigationBarIconBrightness:
          Brightness.dark, // Dark icons for nav bar
    ),
  );

  runApp(ChangeNotifierProvider(create: (_) => GlobalConfig(), child: MyApp()));
}

final GlobalKey<_MyHomePageState> homePageKey = GlobalKey<_MyHomePageState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;
  late UserConfigurationDTO? _userConfigurationDTO;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // _authenticate(); // Authenticate when app starts
    _fetchUserConfiguration();
  }

  Future<void> _fetchUserConfiguration() async {
    final homeService = Mainservice(ApiClient());

    try {
      final userConfiguration = await homeService.getUserConfiguration(1);
      setState(() {
        _userConfigurationDTO = userConfiguration;
        Provider.of<GlobalConfig>(context, listen: false).setConfig(
          _userConfigurationDTO!.name!,
          _userConfigurationDTO!.id!,
          _userConfigurationDTO!.categories!,
        );
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error fetching user info: $e';
      });
    }
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to access the app',
        options: AuthenticationOptions(
          biometricOnly: true, // Only allow fingerprint/face
          stickyAuth: true, // Keep session active
        ),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
    } on PlatformException catch (e) {
      print("Error during authentication: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (!_isAuthenticated) {
    //   return MaterialApp(
    //     home: Scaffold(
    //       backgroundColor: Colors.white,
    //       body: Center(
    //         child: ElevatedButton(
    //           onPressed: _authenticate,
    //           child: const Text('Unlock with Fingerprint'),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(key: homePageKey, title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DateTime dateStart;
  late DateTime dateEnd;
  late Map<NavBarTabType, Widget> _screens;
  NavBarTabType _currentTab = NavBarTabType.HOME;

  void switchTab(NavBarTabType tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  void initState() {
    super.initState();
    dateStart = DateTimeUtils.getFirstDateOfMonth(
      DateTime.now().year,
      DateTime.now().month,
    );
    dateEnd = DateTimeUtils.getLastDateOfMonth(
      DateTime.now().year,
      DateTime.now().month,
    );

    _screens = {
      NavBarTabType.HOME: HomeScreen(),
      NavBarTabType.INSIGHT: InsightScreen(),
      NavBarTabType.CHAT: ChatScreen(),
      NavBarTabType.REPORT: ReportScreen(
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
      NavBarTabType.SETTINGS: SettingsScreen(),
      NavBarTabType.INPUT_TRANSACTION: InputTransaction(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
        child: _screens[_currentTab]!,
      ),
      bottomNavigationBar: NavBar(
        selectedTab: _currentTab,
        onTabSelected: switchTab,
      ),
    );
  }
}
