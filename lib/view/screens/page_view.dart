import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_language_project/control/controllers/login_controller.dart';
import 'package:programming_language_project/model/classes/page_data.dart';
import 'package:programming_language_project/view/screens/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routs.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final List<PageViewData> data = [
    //1
    PageViewData(
      title: "أهلا و سهلا بك\nفي منصة\nالتسويق الإلكتروني",
      desc: "نقدم عروض مييزة عن طريق\nحسم الأسعار قبل انتهاء الصلاحية",
      imgUrl: 'assets/images/1.png',
    ),
    //2
    PageViewData(
      title: 'ضع خطة جديدة\nلتصبح حياتك أسهل',
      desc: "حسم على السعر %30\n.قبل انتهاء الصلاحية بـ30 يوم",
      imgUrl: 'assets/images/2.png',
    ), //3
    PageViewData(
      title: 'استمر في البحث\nلتحصل على سعر أفضل',
      desc: "حسم على السعر %50\n.قبل انتهاء الصلاحية بـ15 يوم",
      imgUrl: 'assets/images/3.png',
    ),
    //4
    PageViewData(
      title: 'انصم الى منصة\nالتسويق الاكتروني',
      desc: "حسم على السعر %70\n.في ما عدا ذلك",
      imgUrl: 'assets/images/4.png',
    ),
  ];
  LoginController n = Get.put(LoginController());
  final PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  int _currindex = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currindex < 3) _currindex++;
      controller.animateToPage(_currindex,
          duration: const Duration(microseconds: 500), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (val) {
              setState(() async {
                _currindex = val;
                if (_currindex == 3) {
                  Future.delayed(const Duration(seconds: 3),
                      () => Get.offNamed(Routes.splash));
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setBool('x', true);
                }
              });
            },
            children: data
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(item.imgUrl),
                          fit: BoxFit.contain),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: const Alignment(0, -0.6),
                            child: Text(
                              item.title,
                              maxLines: 3,
                              style: const TextStyle(
                                  //color: Color(0xff573353),
                                  fontSize: 32,
                                  fontFamily: "Arial",
                                  fontWeight: FontWeight.w700,
                                  height: 1.2),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: const Alignment(0, 0.25),
                            child: Text(
                              item.desc,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                //color: Color(0xff573353),
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          Align(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        _currindex--;
                      },
                      child: const Text('التالي')),
                  _buildPageViewIndicator(),
                  TextButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool('x', true);
                        Get.offNamed(Routes.splash);
                      },
                      child: const Text('تخطي')),
                ],
              )),
          // ),
        ],
      ),
    );
  }

  SmoothPageIndicator _buildPageViewIndicator() {
    return SmoothPageIndicator(
        controller: controller,
        count: data.length,
        effect: const ScrollingDotsEffect(
          dotColor: Color(0xfffda758),
          activeDotScale: 1.15,
        )
        /* const JumpingDotEffect(
        dotColor: Color(0xfffda758),
        dotHeight: 16,
        dotWidth: 16,
        jumpScale: .7,
        verticalOffset: 15,
      ), */
        );
  }
}
