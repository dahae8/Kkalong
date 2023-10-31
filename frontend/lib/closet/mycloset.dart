import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyCloset extends StatefulWidget {
  const MyCloset({
    super.key,
    this.storage,
  });

  final storage;

  @override
  State<MyCloset> createState() => MyClosetState();
}

class MyClosetState extends State<MyCloset> {
  @override
  void initState() {
    super.initState();
    // 초기화 작업 수행
  }

  final savecloset = {
    "list": [
      {"image": "Assets/Image/logo.png"},
      {"image": "Assets/Image/logo.png"},
      {"image": "Assets/Image/logo.png"},
      {"image": "Assets/Image/logo.png"},
    ]
  };
// BearList? bearList;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5BEB5),
//         toolbarHeight: 55,
//         title: const Text(
//           '나의 옷장',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         leading: const Text(''),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                       child: Text(
//                         '안녕하세요,',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                         child: Text(
//                           '나는야김싸피',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFFF5BEB5),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                         child: Text(
//                           '님',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                     child: Text(
//                       '오늘도 깔롱쟁이와 멋쟁이 돼보아요!',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'My깔롱',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xFFF5BEB5),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () async {
//                               final ImagePicker picker = ImagePicker();
//                               final XFile? image = await picker.pickImage(
//                                   source: ImageSource.camera);

//                               if (image != null) {
//                                 // 이미지가 선택되면 처리할 작업을 여기에 추가합니다.
//                                 // image.path를 사용하여 이미지 파일에 접근할 수 있습니다.
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.circular(5.0), // 원하는 각진 정도로 설정
//                               ),
//                               // 다른 스타일 속성들
//                             ),
//                             child: const Text(' + 옷장등록'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Expanded(
//                   //   child:
//                   const Column(
//                     children: [
//                       SizedBox(
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // ),

//                   Expanded(
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, // Number of columns in the grid
//                         crossAxisSpacing: 5.0, // Spacing between columns
//                         mainAxisSpacing: 5.0, // Spacing between rows
//                       ),
//                       itemCount: savecloset['list']?.length ?? 0,
//                       itemBuilder: (BuildContext context, int index) {
//                         final item = savecloset['list']?[index];
//                         if (item == null) {
//                           return const SizedBox(); // 빈 위젯 반환
//                         }
//                         return GestureDetector(
//                           onTap: () {
//                             // 클릭이벤트
//                           },
//                           // child: Card(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Image.asset(
//                                   item["image"] ?? "Assets/Image/logo.png",
//                                   height: 200,
//                                   width: 200),
//                               // Text(
//                               //   item["name"] ?? "Unknown",
//                               //   style: const TextStyle(
//                               //     fontSize: 16,
//                               //     fontWeight: FontWeight.w600,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                           // ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color(0xFFF5BEB5),
            expandedHeight: 55.0,
            floating: true,
            pinned: true,
            title: Text(
              '나의 옷장',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            leading: Text(''),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  '안녕하세요,',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text(
                                    '나는야김싸피',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFF5BEB5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Text(
                                    '님',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Text(
                                '오늘도 깔롱쟁이와 멋쟁이 돼보아요!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         child: Padding(
                //           padding: const EdgeInsets.fromLTRB(20, 0, 10, 12),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text(
                //                 'My깔롱',
                //                 style: TextStyle(
                //                   fontSize: 22,
                //                   fontWeight: FontWeight.w700,
                //                   color: Color(0xFFF5BEB5),
                //                 ),
                //               ),
                //               const Spacer(),
                //               ElevatedButton(
                //                 onPressed: () async {
                //                   final ImagePicker picker = ImagePicker();
                //                   final XFile? image = await picker.pickImage(
                //                       source: ImageSource.camera);

                //                   if (image != null) {
                //                     // 이미지가 선택되면 처리할 작업을 여기에 추가합니다.
                //                     // image.path를 사용하여 이미지 파일에 접근할 수 있습니다.
                //                   }
                //                 },
                //                 style: ElevatedButton.styleFrom(
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(
                //                         5.0), // 원하는 각진 정도로 설정
                //                   ),
                //                   // 다른 스타일 속성들
                //                 ),
                //                 child: const Text(' + 옷장등록'),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 30, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 12),
                        child: Text(
                          'My깔롱',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF5BEB5),
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.camera);

                          if (image != null) {
                            // 이미지가 선택되면 처리할 작업을 여기에 추가합니다.
                            // image.path를 사용하여 이미지 파일에 접근할 수 있습니다.
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5.0), // 원하는 각진 정도로 설정
                          ),
                          // 다른 스타일 속성들
                        ),
                        child: const Text(' + 옷장등록'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 3.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = savecloset['list']?[index];
                  if (item == null) {
                    return const SizedBox(); // 빈 위젯 반환
                  }
                  return GestureDetector(
                    onTap: () {
                      // 클릭이벤트
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          item["image"] ?? "Assets/Image/logo.png",
                          height: 200,
                          width: 200,
                        ),
                        // ... (이전 GridView.builder 코드의 나머지 부분)
                      ],
                    ),
                  );
                },
                childCount: savecloset['list']?.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: const Color(0xFFF5BEB5),
    );

    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFFF5BEB5),
//           toolbarHeight: 55,
//           title: const Text(
//             '나의 옷장',
//             style: TextStyle(color: Colors.white),
//           ),
//           centerTitle: true,
//           elevation: 0,
//           leading: const Text(''),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
//                   child: const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                           child: Text(
//                             '안녕하세요,',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                             child: Text(
//                               '나는야김싸피',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xFFF5BEB5),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                             child: Text(
//                               '님',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                         child: Text(
//                           '오늘도 깔롱쟁이와 멋쟁이 돼보아요!',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               'My깔롱',
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xFFF5BEB5),
//                               ),
//                             ),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 final ImagePicker picker = ImagePicker();
//                                 final XFile? image = await picker.pickImage(
//                                     source: ImageSource.camera);

//                                 if (image != null) {
//                                   // 이미지가 선택되면 처리할 작업을 여기에 추가합니다.
//                                   // image.path를 사용하여 이미지 파일에 접근할 수 있습니다.
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       5.0), // 원하는 각진 정도로 설정
//                                 ),
//                                 // 다른 스타일 속성들
//                               ),
//                               child: const Text(' + 옷장등록'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Expanded(
//                     //   child:
//                     const Column(
//                       children: [
//                         SizedBox(
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // ),

//                     GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, // Number of columns in the grid
//                         crossAxisSpacing: 5.0, // Spacing between columns
//                         mainAxisSpacing: 5.0, // Spacing between rows
//                       ),
//                       itemCount: savecloset['list']?.length ?? 0,
//                       itemBuilder: (BuildContext context, int index) {
//                         final item = savecloset['list']?[index];
//                         if (item == null) {
//                           return const SizedBox(); // 빈 위젯 반환
//                         }
//                         return GestureDetector(
//                           onTap: () {
//                             // 클릭이벤트
//                           },
//                           // child: Card(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Image.asset(
//                                   item["image"] ?? "Assets/Image/logo.png",
//                                   height: 200,
//                                   width: 200),
//                               // Text(
//                               //   item["name"] ?? "Unknown",
//                               //   style: const TextStyle(
//                               //     fontSize: 16,
//                               //     fontWeight: FontWeight.w600,
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                           // ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// void showSnackBar(BuildContext context, String text) {
//   final snackBar = SnackBar(
//     content: Text(text),
//     backgroundColor: const Color(0xFFF5BEB5),
//   );

//   // ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }
}
