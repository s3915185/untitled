import 'package:flutter/material.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/widgets/navbar/ChatSlider.dart';
import 'package:untitled/widgets/navbar/SmoothSlider.dart';
import 'package:untitled/widgets/navbar/navBarItem.dart';
import '../../enum/NavBarTabType.dart';

class NavBar extends StatefulWidget {
  final NavBarTabType selectedTab;
  final Function(NavBarTabType) onTabSelected;

  const NavBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChatSlider(),
        // SmoothSlider(),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavBarItem(
                assetPath: Constants.ICON_HOME,
                label: "Home",
                heightAndWidth: 50,
                isClrAround: false,
                isActive: widget.selectedTab == NavBarTabType.HOME,
                onTap: () => widget.onTabSelected(NavBarTabType.HOME),
              ),
              NavBarItem(
                assetPath: Constants.ICON_LIGHT,
                label: "Insights",
                heightAndWidth: 50,
                isClrAround: false,
                isActive: widget.selectedTab == NavBarTabType.INSIGHT,
                onTap: () => widget.onTabSelected(NavBarTabType.INSIGHT),
              ),
              NavBarItem(
                assetPath: Constants.ICON_CHAT,
                label: "Chat",
                heightAndWidth: 60,
                isClrAround: true,
                isActive: [NavBarTabType.CHAT, NavBarTabType.INPUT_TRANSACTION].contains(widget.selectedTab),
                onTap: () => widget.onTabSelected(NavBarTabType.CHAT),
                isActiveLongPress: true,
              ),
              NavBarItem(
                assetPath: Constants.ICON_TRANSACTION,
                label: "Reports",
                heightAndWidth: 50,
                isClrAround: false,
                isActive: widget.selectedTab == NavBarTabType.REPORT,
                onTap: () => widget.onTabSelected(NavBarTabType.REPORT),
              ),
              NavBarItem(
                assetPath: Constants.ICON_SETTING,
                label: "Settings",
                heightAndWidth: 50,
                isClrAround: false,
                isActive: widget.selectedTab == NavBarTabType.SETTINGS,
                onTap: () => widget.onTabSelected(NavBarTabType.SETTINGS),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
