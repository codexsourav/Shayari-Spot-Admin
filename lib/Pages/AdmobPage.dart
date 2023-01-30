import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mysyriadmin/constents.dart';

class AdmobPage extends StatefulWidget {
  AdmobPage({super.key});

  @override
  State<AdmobPage> createState() => _AdmobPageState();
}

class _AdmobPageState extends State<AdmobPage> {
  bool chackbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: bgcolor,
          leading: IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "Manage Admob Ads",
            style: TextStyle(color: textcolor, fontSize: 14, fontWeight: FontWeight.w300),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Show Ads On App ",
                  style: TextStyle(color: textcolor),
                ),
                CupertinoSwitch(
                  activeColor: boxcolor,
                  trackColor: Colors.red,
                  value: chackbox,
                  onChanged: (value) {
                    setState(() {
                      chackbox = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
