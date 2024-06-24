import 'package:app_news_api/compons/compons.dart';
import 'package:app_news_api/cubit/conter_cube.dart';
import 'package:app_news_api/cubit/statesCounter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Saerch extends StatelessWidget {
  TextEditingController resalt = TextEditingController();
  int n = 0;
  Widget build(BuildContext context) {
    return BlocConsumer<AppNwes, States>(
        builder: ((context, state) {
          print('labal Saerch  $n !!!!!!!!!!!!!!!!!!!!');
          n++;
          List list = AppNwes.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                    controller: resalt,
                    onChanged: (value) {
                      print('input value:');
                      print(value);
                      AppNwes.get(context).getSearech(value);

                      //  list = AppNwes.get(context).search;
                      print(value);
                      print('==========================================');
                      print('data list== $list');
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: Compons.artcalBuild(list, context))
              ],
            ),
          );
        }),
        listener: ((context, state) {}));
  }
}
