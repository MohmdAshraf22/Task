import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:task/task/presentation_layer/bloc/task_bloc.dart';

import '../../../core/services/dep_injection.dart';

class CategoryBuilder extends StatelessWidget {
  final String userName;
  final int id;
  const CategoryBuilder({super.key, required this.userName, required this.id});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30.sp,
      child: Row(
        children: [
          Text(
            "${id.toString()}  ",
            style: TextStyle(fontSize: 12.sp),
          ),
          Expanded(child: Text(userName)),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}

class TabBuilder extends StatelessWidget {
  final TaskBloc bloc;
  final String title;
  final int index;
  const TabBuilder(
      {super.key,
      required this.bloc,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            bloc.add(ChangeTabEvent(index));
          },
          child: Container(
            width: 25.w,
            height: 30.sp,
            decoration: BoxDecoration(
                color: bloc.currentTabIndex == index
                    ? Colors.deepOrange
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20.sp)),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: bloc.currentTabIndex == index
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key, });
  @override
  Widget build(BuildContext context) {
    TaskBloc bloc = sl();
    return SizedBox(
      height: 50.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                const Text("Categories Views"),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("See All"))
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryBuilder(
                        userName: bloc.users[index].userName,
                        id: bloc.users[index].userId);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.sp,
                    );
                  },
                  itemCount: bloc.users.length),
            ),
          ),
        ],
      ),
    );
  }
}

class NoOrderTab extends StatelessWidget {
  const NoOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset("assets/images/no orders.png"),
    );
  }
}

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
