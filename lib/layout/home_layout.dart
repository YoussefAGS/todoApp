import 'package:flutter/material.dart';
import 'package:todo/layout/add_task_bottum_sheet.dart';
import 'package:todo/moudlse/settings/settings.dart';
import 'package:todo/moudlse/tasks_list/task_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = 'HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currintIndex = 0;
  List<Widget> taps = [TasksList(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Todo App'),
        toolbarHeight: MediaQuery.of(context).size.height * .15,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTask();
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(

        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: currintIndex,
          onTap: (index) {
            currintIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: 'list'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: 'setting')
          ],
        ),
      ),
      body: taps[currintIndex],
    );
  }

  void AddTask() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          );
        });
  }
}
