import 'package:flutter/material.dart';
import 'package:streetwyze/config/Constants.dart';
import 'package:streetwyze/ui/screens/auth/login/login_fields.dart';

import 'TextWidgets/TextWidgetHelper.dart';

class CustomContainers {
  static Container logoContainer() {
    return Container(
      width: 180,
      height: 100,
      child: AppTheme.appLogo(),
      margin: EdgeInsets.only(top: 50),
    );
  }

  static Container titleContainer() {
    return Container(
      child:
          TextWidgetHelper.textContainer(AppTitles.login, 25, FontWeight.bold),
      margin: EdgeInsets.only(top: 30),
    );
  }

  static TabBar swipingTab(TabController _tabController) {
    return TabBar(
      tabs: AppConstants.myTabs,
      controller: _tabController,
      indicatorPadding: EdgeInsets.symmetric(
          horizontal: TabBarIndicatorSize.label.index.ceilToDouble() + 70),
      indicatorColor: AppTheme.themeBlue(),
    );
  }

  static TabBarView customTabView(TabController _tabController,
      TextEditingController emailCt, TextEditingController passwordCt) {
    return TabBarView(
      controller: _tabController,
      children: AppConstants.myTabs.map((Tab tab) {
        if (tab.text == Labels.withEmail) {
          return LoginFields.loginWith(loginType.email, emailCt, passwordCt);
        }
        return LoginFields.loginWith(loginType.phone, emailCt, passwordCt);
      }).toList(),
    );
  }
}
