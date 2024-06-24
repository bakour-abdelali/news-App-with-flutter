import 'package:app_news_api/cubit/conter_cube.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../compons/compons.dart';
import '../cubit/statesCounter.dart';

class ScrrenSport extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppNwes, States>(
        builder: ((context, state) {
          var list = AppNwes.get(context).sports;
          return Compons.artcalBuild(list, context);
        }),
        listener: (context, state) {});
  }
}
