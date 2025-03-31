import 'package:untitled/abstract/EnumAndTranslation.dart';

enum NavBarTabType { HOME, INSIGHT, CHAT, REPORT, SETTINGS, INPUT_TRANSACTION }

enum NavBarTab implements EnumAndTranslation{
  home(NavBarTabType.HOME, "Home"),
  insight(NavBarTabType.INSIGHT, "Insight"),
  chat(NavBarTabType.CHAT, "Chat"),
  report(NavBarTabType.REPORT, "Report"),
  settings(NavBarTabType.SETTINGS, "Settings");

  @override
  final NavBarTabType enumType;

  @override
  final String enumTranslation;

  const NavBarTab(this.enumType, this.enumTranslation);
}