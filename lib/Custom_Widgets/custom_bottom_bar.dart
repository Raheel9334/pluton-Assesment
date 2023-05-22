import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/global_variables[1].dart';
import '../Features/Home/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    // const Center(child: Text('Home Screen')),
    // const Center(child: Text('Add Balance Screen')),
    const HomeScreen(),
    // const MainCreateScreen(),
    // const ContactUs(),
    // const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        // showUnselectedLabels: false,
        selectedFontSize: 10.0.sp,
        elevation: 5,
        currentIndex: _page,
        backgroundColor: AppColors.colorPrimary,
        selectedItemColor: Colors.redAccent,
        selectedLabelStyle: TextStyle(
          height: 1.h,
          fontWeight: FontWeight.w900,
        ),
        iconSize: 28,
        onTap: updatePage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
              color: AppColors.backgroundColor,
            ),
            // SvgPicture.asset(
            //   AssetImages1.homeSvg,
            //   color: _page == 0 ? AppColors.colorPrimary : AppColors.colorGrey,
            // ),
            label: _page == 0 ? '____' : '',
            tooltip: 'Add Balance',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.missed_video_call_outlined,
              color: AppColors.backgroundColor,
            ),
            label: '',
            tooltip: 'Add Balance',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.wallet_travel,
              color: AppColors.backgroundColor,
            ),
            //     SvgPicture.asset(
            //   AssetImages1.walletIcon,
            //   color: _page == 2
            //       ? AppColors.backgroundColor
            //       : AppColors.colorPrimary,
            // ),
            label: _page == 2 ? '°' : '',
            tooltip: 'Wallet',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
