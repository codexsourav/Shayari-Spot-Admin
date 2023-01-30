import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysyriadmin/Models/upload/handelupload.dart';
import 'package:mysyriadmin/Pages/AdmobPage.dart';
import 'package:mysyriadmin/Pages/Tabs/HomeTab.dart';
import 'package:mysyriadmin/Pages/Tabs/WalpaperTab.dart';

import 'package:mysyriadmin/constents.dart';
import 'package:mysyriadmin/res/AddAlertBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  var tabs = [const HomeTab(), const WalpaperTab()];
  bool loading = false;

  uploadTask() async {
    setState(() {
      loading = true;
    });
    var data = await handelupload();

    if (data.containsKey('error')) {
      print(data['error']);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: bgcolor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(
              Icons.power_settings_new_rounded,
              size: 20,
              color: iconcolor,
            )),
        title: const Text(
          "Gujarati Suvichar & Shayaris Admin",
          style: TextStyle(color: textcolor, fontSize: 15, fontWeight: FontWeight.w300),
        ),
     
      ),
      body: tabs[tabIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 0),
        child: FloatingActionButton(
          backgroundColor: sndbg,
          onPressed: () {
            tabIndex == 0
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AddAlertBox();
                    },
                  )
                : !loading
                    ? uploadTask()
                    : null;
          },
          child: tabIndex == 0
              ? const Icon(
                  Icons.add,
                  color: iconcolor,
                )
              : !loading
                  ? const Icon(
                      Icons.add_a_photo,
                      color: iconcolor,
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: const [
                        Icon(
                          Icons.upload,
                          size: 14,
                        ),
                        CircularProgressIndicator(color: whitecolor),
                      ],
                    ),
          // child: Icon(
          //   tabIndex == 0 ? Icons.add : Icons.add_a_photo,
          //   color: iconcolor,
          // ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: bgcolor,
        height: 55,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                setState(() {
                  tabIndex = 0;
                });
              },
              icon: Icon(
                Icons.line_style_sharp,
                color: tabIndex == 0 ? iconcolor : const Color.fromARGB(88, 255, 255, 255),
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  tabIndex = 1;
                });
              },
              icon: Icon(
                Icons.image,
                color: tabIndex == 1 ? iconcolor : const Color.fromARGB(83, 255, 255, 255),
              ))
        ]),
      ),
    );
  }
}
