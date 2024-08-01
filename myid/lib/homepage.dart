import 'package:flutter/material.dart';

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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://thumbs.wbm.im/pw/medium/2b3135dc53beea0533f461ec14b77c54.avif",
              ),
              radius: 160,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sudhir Manandhar",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
              ),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Text(
                  "Share",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text("Share"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
        ],
      ),
    );
  }
}
