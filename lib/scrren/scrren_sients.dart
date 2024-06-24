import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../compons/compons.dart';
import '../cubit/conter_cube.dart';
import '../cubit/statesCounter.dart';

class ScrrenSiantes extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<AppNwes, States>(
        builder: ((context, state) {
          var list = AppNwes.get(context).science;
          return Compons.artcalBuild(list, context);
        }),
        listener: (context, state) {});
  }
}
