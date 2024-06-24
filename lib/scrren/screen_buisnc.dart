import 'package:app_news_api/compons/compons.dart';
import 'package:app_news_api/cubit/conter_cube.dart';
import 'package:app_news_api/cubit/statesCounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBuisns extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppNwes, States>(
        builder: ((context, state) {
          var list = AppNwes.get(context).buisens;
          return Compons.artcalBuild(list, context);
        }),
        listener: (context, state) {});
  }
}
