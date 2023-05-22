import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../Constants/global_variables[1].dart';
import '../../Provider/userProvider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  final ScrollController _scrollController = ScrollController();
  double _height = 100.0;

  UserProvider? _user;

  void initState() {
    
    _user = Provider.of<UserProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHit();
    });
    super.initState();
  }

  Future<void> ApiHit() async {
    await _user!.getMoviesData(context);
    _user!.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<UserProvider>(context, listen: true);

    _user?.userData == null
        ? ' '
        : print('PROVIDER DATA : ${_user?.userData!.results[0]}');
    return Scaffold(
      backgroundColor: AppColors.colorGrey,
      appBar: AppBar(
        backgroundColor: AppColors.colorPrimary,
        title: _user!.getMovingData != null
            ? Text(
                _user!.getMovingData!.results![0]!.title.toString(),
                style: TextStyle(color: Colors.white, fontSize: 25.sp),
              )
            : const SizedBox(
                child: Text("Unbroken"),
              ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_open,
            color: AppColors.backgroundColor,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350.h,
              color: Colors.redAccent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Text(
                "Watch Movies",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0.sp,
                  color: AppColors.backgroundColor,
                  fontStyle: FontStyle.normal,
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      //2,
                      _user!.getMovingData!.results!.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _user!.getMovingData != null
                                ? Container(
                                    height: 250.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.backgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(2.0.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://api.themoviedb.org/$index${_user!.getMovingData!.results![index]!.posterPath.toString()}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                        
                            SizedBox(height: 5.h),
                            _user!.getMovingData != null
                                ? SizedBox(
                                    width: 120.w,
                                    child: Text(
                                      _user!
                                          .getMovingData!.results![index]!.title
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                  )
                                : SizedBox(
                                    child: Text(
                                      "UnBroken",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                  ),
                            // Text(
                            //   "MovieName",
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.w400,
                            //     fontSize: 20.0.sp,
                            //     color: AppColors.backgroundColor,
                            //     fontStyle: FontStyle.normal,
                            //   ),
                            // ),
                            SizedBox(height: 2.h),
                            _user!.getMovingData != null
                                ? Text(
                                    _user!.getMovingData!.results![index]!
                                        .releaseDate
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10.sp),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
