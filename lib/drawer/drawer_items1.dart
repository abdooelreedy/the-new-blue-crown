import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerItems1 {
  static const home = DrawerItem(title: 'Home', icon: Icons.home);
  static const orderPage = DrawerItem(title: 'Order_Page', icon: Icons.bookmark_border);
  static const orderHistory = DrawerItem(title: 'Order_History', icon: Icons.history);
  static const wallet = DrawerItem(title: 'Wallet', icon: Icons.account_balance_wallet);
  static const notifications = DrawerItem(title: 'Notifications', icon: Icons.notifications);
  static const complaints_and_suggestions = DrawerItem(title: 'Complaints_and_Suggestions', icon: Icons.report);
  static const profile = DrawerItem(title: 'Profile', icon: Icons.person);
  static const settings = DrawerItem(title: 'Settings', icon: Icons.settings);
  static const offers = DrawerItem(title: 'Offers', icon: Icons.local_offer_sharp);
  static const logout = DrawerItem(title: 'LogOut', icon: Icons.logout);

  static final List<DrawerItem> all = [
    home,
    orderPage,
    orderHistory,
    wallet,
    notifications,
    complaints_and_suggestions,
    profile,
    settings,
    offers,
    logout
  ];

}