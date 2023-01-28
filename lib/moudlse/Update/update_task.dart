import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/moudlse/Update/update_filed.dart';
import 'package:todo/shared/network/local/firebase.dart';

import '../../shared/stayls/colours.dart';

class Update extends StatefulWidget {
  static String routname = "Update";

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late TextEditingController titlecontroller;

  late TextEditingController decriptionController;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;
    titlecontroller = TextEditingController(text: task.title);
    decriptionController = TextEditingController(text: task.descrepition);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Edit Task".tr(),
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              UpdateField(TextInputType.text, titlecontroller, "Title".tr(), (value) {
                task.title = value;
              }, (value) {
                if (value == null || value.isEmpty) {
                  return "title slould not be empty";
                }
              }),
              SizedBox(
                height: 30,
              ),
              UpdateField(
                  TextInputType.multiline, decriptionController, "Descripition".tr(),
                  (value) {
                task.descrepition = value;
              }, (value) {
                if (value == null || value.isEmpty) {
                  return "Description slould not be empty";
                }
              }),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Select(context,task);
                  setState(() {

                  });
                },
                child: Text(
                  '${DateTime.fromMillisecondsSinceEpoch(task.data).year}/${DateTime.fromMillisecondsSinceEpoch(task.data).month}/${DateTime.fromMillisecondsSinceEpoch(task.data).day}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Praimary_colour,
                        fontWeight: FontWeight.normal,
                        fontSize: 19,
                      ),
                ),
              ),
              ElevatedButton(onPressed: () {
                if (formkey.currentState!.validate()) {
                  update(task);
                  Navigator.pop(context);

                }
              }, child: Text('Edit Task'.tr()))

            ],
          ),
        ),
      ),
    );
  }

  void Select(BuildContext context,Task task) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.fromMillisecondsSinceEpoch(task.data),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if (chosenDate == null) {
      return;
    }
    task.data= DateUtils.dateOnly(chosenDate).millisecondsSinceEpoch;

    setState(() {});
    return;
  }
}
