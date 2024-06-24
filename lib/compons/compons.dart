import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class Compons {
  static Widget buildItemArtcal(artcal, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Image.network("https://c.biztoc.com/p/0da497b720e1b7bd/og.webp"),
            Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("${artcal['urlToImage']}"),
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 120,
              child: Column(
                //textBaseline: TextBaseline.ideographic,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Container()
                  Expanded(
                    child: Text('${artcal['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge
                        // TextStyle(
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    '${artcal['publishedAt']}',
                    maxLines: 4,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  static Widget artcalBuild(List list, BuildContext context) {
    return ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Compons.buildItemArtcal(list[index], context);
              }),
              separatorBuilder: ((context, index) => Divider(
                    color: Colors.grey,
                    thickness: 1,
                  )),
              itemCount: list.length);
        },
        fallback: ((context) {
          return Center(
            child: CircularProgressIndicator(
                // color: Colors.green,
                ),
          );
        }));
  }

  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Row(
  //       children: [
  //         // Image.network("https://c.biztoc.com/p/0da497b720e1b7bd/og.webp"),
  //         Container(
  //             width: 120,
  //             height: 120,
  //             decoration: BoxDecoration(
  //               //color: Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //               image: DecorationImage(
  //                 image: NetworkImage(
  //                     "https://c.biztoc.com/p/0da497b720e1b7bd/og.webp"),
  //                 fit: BoxFit.cover,
  //               ),
  //             )),
  //         const SizedBox(
  //           width: 20,
  //         ),
  //         Expanded(
  //             child: Container(
  //           height: 120,
  //           child: Column(
  //             //textBaseline: TextBaseline.ideographic,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               //Container()
  //               Expanded(
  //                 child: Text(
  //                   'title titletitletitle v title vtitle titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle',
  //                   maxLines: 4,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               // const SizedBox(
  //               //   height: 10,
  //               // ),
  //               Text(
  //                 'sup taitle',
  //                 maxLines: 4,
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                     overflow: TextOverflow.ellipsis,
  //                     color: Colors.grey),
  //               )
  //             ],
  //           ),
  //         ))
  //       ],
  //     ),
  //   );
}
