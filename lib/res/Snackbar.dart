import 'package:flutter/material.dart';

SnackBar MySnackBar({context}) {
  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.blue[800], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.copy_outlined, size: 15, color: Colors.white),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child:
                  Text('No Copy On Demo Mode', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const Spacer(),
            TextButton(
                onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                child: Text("OK"))
          ],
        ),
      ),
    ),
  );
}

    // ScaffoldMessenger.of(context).showSnackBar();
