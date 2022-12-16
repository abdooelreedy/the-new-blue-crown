import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerItems2 {
  static const home = DrawerItem(title: 'الصفحة الرئيسية', icon: Icons.home);
  static const orderPage = DrawerItem(title: 'الطلبات', icon: Icons.bookmark_border);
  static const orderHistory = DrawerItem(title: 'سجل الطلبات', icon: Icons.history);
  static const wallet = DrawerItem(title: 'المحفظة', icon: Icons.account_balance_wallet);
  static const notifications = DrawerItem(title: 'الإشعارات', icon: Icons.notifications);
  static const complaints_and_suggestions = DrawerItem(title: 'الشكاوي والإقتراحات', icon: Icons.report);
  static const profile = DrawerItem(title: 'الملف الشخصي', icon: Icons.person);
  static const settings = DrawerItem(title: 'الإعدادات', icon: Icons.settings);
  static const offers = DrawerItem(title: 'العروض', icon: Icons.local_offer_sharp);
  static const logout = DrawerItem(title: 'تسجيل الخروج', icon: Icons.logout);

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