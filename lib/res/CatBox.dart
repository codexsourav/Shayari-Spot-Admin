import 'package:flutter/material.dart';
import 'package:mysyriadmin/Pages/ShriPage.dart';
import 'package:mysyriadmin/constents.dart';

Widget CatBox(
    {required context,
    required Widget text,
    required String id,
    required String lable,
    onclickUpdate}) {
  return Container(
    margin: const EdgeInsets.only(top: 15, bottom: 5),
    width: double.infinity,
    decoration: BoxDecoration(color: boxcolor, borderRadius: BorderRadius.circular(10)),
    height: 64,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShriPage(id: id, catename: text, lable: lable),
            ));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width - 150,
            height: 64,
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            child: text,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: onclickUpdate,
                icon: const Icon(
                  Icons.edit,
                  size: 18,
                  color: Color.fromARGB(179, 255, 255, 255),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
