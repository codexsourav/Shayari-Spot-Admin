import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mysyriadmin/Models/db/fbFunc.dart';
import 'package:mysyriadmin/constents.dart';

Widget imgBox({context, required String url, required int index}) {
  double width = MediaQuery.of(context).size.width;
  return Stack(
    fit: StackFit.expand,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: url,
          height: 100,
          width: (width / 2) - 50,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
              padding: const EdgeInsets.all(30),
              child: const CircularProgressIndicator(
                color: whitecolor,
              )),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Color.fromARGB(255, 252, 111, 101),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          ),
          child: GestureDetector(
            onTap: () async {
              await FbFunc().deleteImg(index, url);
            },
            child: const Icon(
              Icons.delete_forever,
              size: 15,
              color: Color.fromARGB(255, 255, 82, 59),
            ),
          ),
        ),
      ),
    ],
  );
}
