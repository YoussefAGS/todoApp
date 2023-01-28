import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/moudlse/tasks_list/task-item.dart';
import 'package:todo/shared/network/local/firebase.dart';
import 'package:todo/shared/stayls/colours.dart';

import '../../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  DateTime selected=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CalendarTimeline(
          initialDate: selected,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date)  {
          selected=date;
          setState(() {

          });

        },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.onSecondary,
          dayColor: Praimary_colour,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Praimary_colour,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        StreamBuilder<QuerySnapshot<Task>>(
            stream: getTaskFromFirebase(selected),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('something wrong');
              }
              List<Task> tasks =
                  snapshot.data?.docs.map((task) => task.data()).toList() ?? [];

              return Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (d, index) {
                    return TaskItem(tasks[index]);
                  },
                ),
              );
            }),
      ],
    );
  }
}
