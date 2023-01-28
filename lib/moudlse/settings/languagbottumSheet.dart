import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';


class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changelanguage('en');
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'english'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(
                      color: provider.languageCode=="en"?Theme.of(context).colorScheme.primary:
                  Colors.black),
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color:provider.languageCode=="en"?Theme.of(context).colorScheme.primary:
                  Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              provider.changelanguage('ar');
              context.setLocale(Locale("ar","EG"));
              Navigator.pop(context);

            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Arabic'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color:provider.languageCode=="ar"?Theme.of(context).colorScheme.primary:
                  Colors.black,
                  ),
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color:provider.languageCode=="ar"?Theme.of(context).colorScheme.primary:
                  Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
