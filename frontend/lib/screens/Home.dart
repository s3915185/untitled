import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/api/ApiClient.dart';
import 'package:untitled/widgets/handler/PieChartHandler.dart';
import 'package:untitled/widgets/account/AccountBadge.dart';
import 'package:untitled/widgets/balance/BalanceDisplay.dart';
import '../GlobalConfig.dart';
import '../dto/UserInfoDTO.dart';
import '../layouts/BasicLayout.dart';
import '../widgets/message/BlockMessage.dart';
import 'HomeService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserInfoDTO? _userInfo;
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // _fetchUserInfo();
  }

  // // Fetch user info from the API
  // Future<void> _fetchUserInfo() async {
  //   final homeService = HomeService(ApiClient());
  //
  //   try {
  //     final userInfo = await homeService.getUserInfo(1);
  //     setState(() {
  //       _userInfo = userInfo;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //       _errorMessage = 'Error fetching user info: $e';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<GlobalConfig>(context); // Access the config

    // if (_isLoading) {
    //   return const Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }
    //
    // if (_errorMessage.isNotEmpty) {
    //   return Scaffold(
    //     body: Center(
    //       child: Text(
    //         _errorMessage,
    //         style: TextStyle(color: Colors.red, fontSize: 18),
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      body: BasicLayout(
        childrens: [
          AccountBadge(
            imagePath: Constants.PICTURE_PERSON,
            label: config.username,
          ),
          BalanceDisplay(
            currentBalance: 75986213,
            spentBalance: 178856956,
            totalBalance: 254843169,
          ),
          PieChartHandler(),
          const BlockMessage(
            header: "AI automated advice",
            message:
            "If you reduce spending by 7% in Utilities, you’ll have an extra 12,520,000 VND for future goals...",
          ),
        ],
      ),
    );
  }
}
