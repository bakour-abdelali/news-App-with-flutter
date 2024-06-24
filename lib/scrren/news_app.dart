import 'package:app_news_api/scrren/screen_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/conter_cube.dart';
import '../cubit/statesCounter.dart';

class ScrrenNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppNwes, States>(
        listener: (context, state) {},
        //   builder: ((ConterCube, ConterStat) => Text("sdhfh")),
        builder: (context, statte) {
          AppNwes cuib = AppNwes.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return Saerch();
                      })));
                    },
                    icon: const Icon(
                      Icons.search,
                    )),
                IconButton(
                    onPressed: () {
                      AppNwes.get(context)..ChangeMode();
                      // ..getScience()
                      // ..getSports()
                      // ..getBuisnss();
                      //AppNwes.get(context).
                    },
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                    )),
              ],
              title: Text('News App'),
            ),
            body: cuib.scrren[cuib.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cuib.index,
              elevation: 200,
              items: cuib.bottonNavigton,
              onTap: ((value) {
                cuib.changInadex(value);
              }),
            ),
          );
        });
  }
}
