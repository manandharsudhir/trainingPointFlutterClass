// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Divider(),
        ),
        title: const Text(
          "My Id",
        ),
      ),
      // body: Container(
      //   color: Colors.red[100],
      //   child: Column(
      //     //vertically kata rakhni vanera define garni
      //     // mainAxisAlignment: MainAxisAlignment.spaceAround,

      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Hello world",
      //         style: TextStyle(fontSize: 24),
      //       ),
      //       Text(
      //         "data",
      //         style: TextStyle(fontSize: 24),
      //       ),
      //       Container(
      //         height: 300,
      //         color: Colors.blue,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Text(
      //               "Hello world",
      //               style: TextStyle(fontSize: 24),
      //             ),
      //             Text(
      //               "data",
      //               style: TextStyle(fontSize: 24),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Stack(
                children: [
                  Container(
                    // backgroundImage: NetworkImage(
                    //   "https://thumbs.wbm.im/pw/medium/2b3135dc53beea0533f461ec14b77c54.avif",
                    // ),
                    child: Image.asset(
                      "assets/images/profile.avif",
                      fit: BoxFit.cover,
                    ),
                    height: 320,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      child: Text("Call Me"),
                      radius: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sudhir Manandhar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("+9779812345678"),
                  Text("Manamaiju,Kathmandu"),
                ],
              ),
            ),
          ),

          // Container(
          //   height: 300,
          //   width: 300,
          //   decoration: BoxDecoration(
          //     color: Colors.red,
          //     shape: BoxShape.circle,
          //   ),
          //   clipBehavior: Clip.hardEdge,
          //   child: Image.network(
          //     "https://thumbs.wbm.im/pw/medium/2b3135dc53beea0533f461ec14b77c54.avif",
          //     fit: BoxFit.cover,
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Center(
                child: Text(
                  "Share",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {},
          //     child: const Text("Share"),
          //     style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
        ],
      ),
    );
  }
}
