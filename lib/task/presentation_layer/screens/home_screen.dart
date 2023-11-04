import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:task/task/presentation_layer/bloc/task_bloc.dart';
import 'package:task/task/presentation_layer/components/components.dart';

import '../../../core/services/dep_injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TaskBloc bloc = sl();
    List<BannerModel> listBanners = [
      BannerModel(imagePath: "assets/images/Frame.png", id: "1"),
      BannerModel(imagePath: "assets/images/Frame.png", id: "2"),
      BannerModel(imagePath: "assets/images/Frame.png", id: "3"),
      BannerModel(imagePath: "assets/images/Frame.png", id: "4"),
    ];
    List<String> tabs = ["Categories", "Services", "Orders"];
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.deepOrange,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(
                color: Colors.deepOrange,
              ),
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined), label: "Assets"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.support_agent), label: "Support"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Profile"),
              ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 40.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 12.sp,
                                  backgroundImage: const AssetImage(
                                      "assets/images/profile.png"),
                                ),
                                Text(
                                  " Hey, Ahmed 🙏",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text("Multi-Services for Your Real Estate Needs",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp)),
                            Text(
                                "Explore diverse real estate services for all your needs: property management, construction, insurance and more in one place.",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp)),
                            SizedBox(height: 1.h),
                            Expanded(
                              child: BannerCarousel(
                                margin: EdgeInsets.zero,
                                banners: listBanners,
                                customizedIndicators:
                                    const IndicatorModel.animation(
                                        width: 7,
                                        height: 7,
                                        spaceBetween: 2,
                                        widthAnimation: 25),
                                // height: 150,
                                activeColor: Colors.deepOrange,
                                disableColor: Colors.grey,
                                animation: true,
                                borderRadius: 10,
                                onTap: (id) => print(id),

                                ///width: 250,
                                indicatorBottom: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                    height: 60.h,
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 7.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                border: Border.all(color: Colors.black, width: .5)),
                            padding: EdgeInsets.all(1.h),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TabBuilder(
                                      bloc: bloc,
                                      title: tabs[index],
                                      index: index);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 10.sp,
                                  );
                                },
                                itemCount: tabs.length),
                          ),
                          Expanded(
                            child: SizedBox(child: bloc.currentTab),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
