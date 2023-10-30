// import 'package:flutter/material.dart';

// class MyPage extends StatefulWidget {
//   const MyPage({super.key, this.storage});

//   final storage;
//   @override
//   State<MyPage> createState() => MyPageState();
// }

// class MyPageState extends State<MyPage> {

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: const Color(0xFFF5BEB5),
//       toolbarHeight: 55,
//       title: const Text('마이페이지'),
//       centerTitle: true,
//       elevation: 0,
//       leading: const Text(''),
//     ),
//     body: Container(
//       padding: const EdgeInsets.all(30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//               margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
//               child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                         child: Text(
//                           '안녕하세요,',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                           child: Text(
//                             '0000 ',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xffA1CBA1)),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                           child: Text(
//                             '님',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
//                       child: Text(
//                         '오늘도 깔롱쟁이와 멋쟁이 돼보아요!',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ])),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
//                     child: Text(
//                       'My깔롱',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFFF5BEB5)),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               const Row(children: [
//                                 Text(
//                                   '저장한 코디 ',
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   '(3건)',
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ]),
//                                   GestureDetector(
//                                       onTap: () {
//                                         // Navigator.push(
//                                         //   context,
//                                         //   MaterialPageRoute(
//                                         //       builder: (BuildContext context) =>
//                                         //           FavoriteMoreRec(
//                                         //               favorRec: favorrecipe)),
//                                         // );
//                                       },
//                                       child: const Text('더보기')),
//                                     const Text('')
//                             ],
//                           ),
//                         ),
//                       ),

//                                  GestureDetector(
//                                     onTap: () {
//                                       // Navigator.push(
//                                       //   context,
//                                       //   MaterialPageRoute(
//                                       //       builder: (BuildContext context) =>
//                                       //           FavoriteMoreFood(
//                                       //               favorIngr:
//                                       //                   favoringredient)),
//                                       // );
//                                     },
//                                     child: const Text('더보기')),
//                                 const Text('')
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         child: GestureDetector(
//                             onTap:
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //       builder: (BuildContext context) =>
//                                     //           FavoriteMoreFood(
//                                     //               favorIngr: favoringredient)),
//                                     // );

//                                     ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//       );

// }
// }

// void showSnackBar(BuildContext context, Text text) {
//   final snackBar =
//       SnackBar(content: text, backgroundColor: const Color(0xffA1CBA1));

// // Find the ScaffoldMessenger in the widget tree
// // and use it to show a SnackBar.
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, this.storage});

  final storage;

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 작업 수행
  }

  final savecloItem = {
    "list": [
      {"image": "Assets/Image/logo.png", "name": "깔쌈한코디1"},
      {"image": "Assets/Image/logo.png", "name": "깔쌈코디2"},
      {"image": "Assets/Image/logo.png", "name": "깔삼코디3"},
      {"image": "Assets/Image/logo.png", "name": "하늘하늘코디3"},
    ]
  };
// BearList? bearList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5BEB5),
          toolbarHeight: 55,
          title: const Text(
            '마이프로필',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          leading: const Text(''),
        ),
        body:
            // SingleChildScrollView(
            //     child:
            Container(
          padding: const EdgeInsets.all(30),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My깔롱',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFF5BEB5),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // 버튼 클릭 이벤트
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5.0), // 원하는 각진 정도로 설정
                                ),
                                // 다른 스타일 속성들
                              ),
                              child: const Text('Follow List'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child:
                    Column(
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      '저장한 코디 ',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '(3건)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // 이동 로직을 추가하세요.
                                  },
                                  child: const Text('더보기'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 5.0, // Spacing between columns
                          mainAxisSpacing: 5.0, // Spacing between rows
                        ),
                        itemCount: savecloItem['list']?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          final item = savecloItem['list']?[index];
                          if (item == null) {
                            return const SizedBox(); // 빈 위젯 반환
                          }
                          return GestureDetector(
                            onTap: () {
                              // 클릭이벤트
                            },
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                      item["image"] ?? "Assets/Image/logo.png",
                                      height: 100,
                                      width: 100),
                                  Text(
                                    item["name"] ?? "Unknown",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              // const ListTile(
              //   title: Text('로그아웃'),
              //   trailing: Icon(Icons.chevron_right),
              // ),
              // Container(
              //   height: 1.0,
              //   width: 400.0,
              //   color: const Color.fromARGB(255, 201, 199, 199),
              // ),
              // const ListTile(
              //   title: Text('정보수정'),
              //   trailing: Icon(Icons.chevron_right),
              // ),
              // Container(
              //   height: 1.0,
              //   width: 400.0,
              //   color: const Color.fromARGB(255, 201, 199, 199),
              // ),
            ],
          ),
        ));
    // );
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: const Color(0xFFF5BEB5),
  );

  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
