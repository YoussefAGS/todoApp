import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/moudlse/settings/languagbottumSheet.dart';
import 'package:todo/moudlse/settings/thememode.dart';
import 'package:todo/provider/my_provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language'.tr(),
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              sHowlanguagbottmeSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.currentTheme == ThemeMode.light
                      ? Colors.white
                      : Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  borderRadius: BorderRadius.circular(12),
                  border:
                  Border.all(color: Theme
                      .of(context)
                      .colorScheme
                      .primary)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.languageCode=='en'?'english'.tr():'Arabic'.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Theme
                        .of(context)
                        .colorScheme
                        .primary),
                  ),
                  Icon(
                      Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(
            'Theme'.tr(),
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              sHowThemebottmeSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: provider.currentTheme == ThemeMode.light
                      ? Colors.white
                      : Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  borderRadius: BorderRadius.circular(12),
                  border:
                  Border.all(color: Theme
                      .of(context)
                      .colorScheme
                      .primary)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${provider.currentTheme.name}'.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Theme
                        .of(context)
                        .colorScheme
                        .primary),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
void sHowlanguagbottmeSheet() {
  showModalBottomSheet(context: context, builder:(context){
    return LanguageBottomSheet();
  });
}
void sHowThemebottmeSheet() {
  showModalBottomSheet(context: context, builder:(context){
    return Thememodebottom();
  });
}
}
