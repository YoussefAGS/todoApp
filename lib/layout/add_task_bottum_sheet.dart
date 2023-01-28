import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/componats/componants.dart';
import 'package:todo/shared/network/local/firebase.dart';
import 'package:todo/shared/stayls/colours.dart';

import '../models/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var descriptionController = TextEditingController();

  var titleController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Task'.tr(),
              textAlign: TextAlign.start,
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Black_colour),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return "enter the title";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          label: Text('Title'.tr()),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Praimary_colour)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Praimary_colour))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return "enter the Desctiption";
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                          label: Text('Description'.tr()),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Praimary_colour)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Praimary_colour))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Select Date'.tr(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Black_colour),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        SelectDate(context);
                      },
                      child: Text(
                        '${selectedDate.year}/${selectedDate
                            .month}/${selectedDate.day}',
                        textAlign: TextAlign.center,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(
                          color: Praimary_colour,
                          fontWeight: FontWeight.normal,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Task task = Task(title: titleController.text,
                            descrepition: descriptionController.text,
                            data:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                        showloding(context, 'loading'.tr());
                        AddTasktoFirebase(task).then((value) {
                          hideloding(context);
                          showmassage(
                              context, "Successfully", "ok", "Task add".tr(), () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        });
                      }
                    }, child: Text('Add Task'.tr()))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void SelectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {

    });
    return;
  }
}
