import 'package:deentok/common/widgets/dark_config/dark_mode_config.dart';
import 'package:deentok/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:deentok/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:deentok/features/users/views/user_profile_screen.dart';
import 'package:deentok/features/videos/views/video_timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../../../features/videos/views/video_recording_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    // "discover",
    "xxxx",
    // "inbox",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = darkModeConfig.value;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          // Offstage(
          //   offstage: _selectedIndex != 1,
          //   child: const DiscoverScreen(),
          // ),
          // Offstage(
          //   offstage: _selectedIndex != 3,
          //   child: const InboxScreen(),
          // ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "henry",
              tab: "",
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + Sizes.size12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  text: "Home",
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  onTap: () => _onTap(0),
                  selectedIndex: _selectedIndex,
                ),
                // NavTab(
                //   text: "Discover",
                //   isSelected: _selectedIndex == 1,
                //   icon: FontAwesomeIcons.compass,
                //   selectedIcon: FontAwesomeIcons.solidCompass,
                //   onTap: () => _onTap(1),
                //   selectedIndex: _selectedIndex,
                // ),
                Gaps.h24,
                GestureDetector(
                  child: PostVideoButton(onTap: _onPostVideoButtonTap, inverted: _selectedIndex != 0),
                ),
                Gaps.h24,
                // NavTab(
                //   text: "Inbox",
                //   isSelected: _selectedIndex == 3,
                //   icon: FontAwesomeIcons.message,
                //   selectedIcon: FontAwesomeIcons.solidMessage,
                //   onTap: () => _onTap(3),
                //   selectedIndex: _selectedIndex,
                // ),
                NavTab(
                  text: "Profile",
                  isSelected: _selectedIndex == 4,
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  onTap: () => _onTap(4),
                  selectedIndex: _selectedIndex,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
