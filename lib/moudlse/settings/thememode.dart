
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/my_provider.dart';

class Thememodebottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changetheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'light'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!.copyWith(
                      color: provider.currentTheme==ThemeMode.light?Theme.of(context).colorScheme.primary:
                      Colors.black)
                ),
                Icon(
                  Icons.done,
                  size: 30,
                    color: provider.currentTheme==ThemeMode.light?Theme.of(context).colorScheme.primary:
                    Colors.black
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              provider.changetheme(ThemeMode.dark);
              Navigator.pop(context);

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'dark'.tr(),
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: provider.currentTheme==ThemeMode.dark?Theme.of(context).colorScheme.primary:
                        Colors.black
                  )),
                Icon(
                  Icons.done,
                  size: 30,
                    color: provider.currentTheme==ThemeMode.dark?Theme.of(context).colorScheme.primary:
                    Colors.black
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
