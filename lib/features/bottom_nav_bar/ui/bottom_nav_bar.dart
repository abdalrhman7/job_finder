import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JobFinder/core/helper/spacing.dart';
import 'package:JobFinder/core/theming/styels.dart';
import 'package:JobFinder/core/widgets/show_bar.dart';
import 'package:JobFinder/features/applied_job/ui/applied_job_screen.dart';
import 'package:JobFinder/features/chat/ui/chat_screen.dart';
import 'package:JobFinder/features/home/ui/home_screen.dart';
import 'package:JobFinder/features/profile/ui/profile_screen.dart';
import 'package:JobFinder/features/saved/logic/save_job_cubit.dart';
import 'package:JobFinder/features/saved/ui/saved_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final _bottomNavbarController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SavedScreen(),
      AppliedJobScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: _buildScreens()[0],
        item: ItemConfig(
          icon: Icon(Icons.home),
          title: "Home",
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[1],
        item: ItemConfig(
          icon: Icon(Icons.bookmark_outline),
          title: "Saved",
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[2],
        item: ItemConfig(
          icon: Icon(Icons.account_balance),
          title: "Applied",
        ),
      ),
      PersistentTabConfig(
        screen: _buildScreens()[3],
        item: ItemConfig(
          icon: Icon(Icons.person),
          title: "Profile",
        ),
      ),
    ];
  }

  PersistentTabView _persistentTabView() {
    return PersistentTabView(
      tabs: _navBarsItems(),
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              color: Colors.white,
              border: Border.all(width: .5),
            ),
          ),
      controller: _bottomNavbarController,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,

      resizeToAvoidBottomInset: true,
      navBarOverlap:  NavBarOverlap.custom(overlap: -1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: Colors.white,
        title: Text(
          'JobFinder',
          style: TextStyles.font30BlackSemiBold,
        ),
        actions: [
          GestureDetector(
              onTap: () {
                pushScreen(
                  context,
                  screen: ChatScreen(),
                  withNavBar: false,
                );
              },
              child: Icon(Icons.message_outlined)),
          horizontalSpace(12)
        ],
      ),
      body: _persistentTabView(),
    );
  }
}
