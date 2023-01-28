import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/moudlse/Update/update_task.dart';
import 'package:todo/models/task.dart';
import 'package:todo/shared/network/local/firebase.dart';
import 'package:todo/shared/stayls/colours.dart';

class TaskItem extends StatelessWidget {
  Task task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(onPressed: (context){
            DeletTask(task.id);

          },
            label: 'Delete'.tr(),
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
          SlidableAction(onPressed: (context){
              Navigator.pushNamed(context, Update.routname,arguments: task);
          },
            label: 'Edit'.tr(),
            backgroundColor: Colors.green,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 6),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 3,
              color: Praimary_colour,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(task.descrepition,style: TextStyle
                    (
                    color: Theme.of(context).colorScheme.onSecondary
                  ),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              decoration: BoxDecoration(
                  color: Praimary_colour,
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
