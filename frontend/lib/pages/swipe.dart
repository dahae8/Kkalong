import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  final TextEditingController inputController = TextEditingController();
  final Dio dio = Dio(); // Dio HTTP 클라이언트 초기화
  final serverURL = 'http://k9c105.p.ssafy.io:8761';
  // final serverURL = 'https://codingapple1.github.io/app/data.json';

  List<String> cards = [
    'https://image.newsis.com/2022/07/08/NISI20220708_0001037503_web.jpg',
    'https://onlyyugioh.com/web/product/big/202205/5df59663bbd221d8148d3986fbe424c1.jpg',
    'https://image.zdnet.co.kr/2023/07/26/f7981bfffc284d23d6335b1223bd554c.jpg',
    'https://cdn.wwdkorea.com/news/photo/202305/4784_188109_5932.jpeg',
    'https://blog.kakaocdn.net/dn/3ZrbN/btqCJlADYIx/Y56IertbI9cyiKnRMK4ys1/img.png',

  ];

  var data = [];
  var imgUrl = '';
  var fashionSeq = 0;

  Future<dynamic> dioData() async {
    try {
      final response = await dio.get('$serverURL/api/assess',
        // queryParameters: {'userEmail': id}
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
      print('getData');
    }
  }

  Future<dynamic> likeData() async {
    Response response;
    try {
      // final deviceToken = getMyDeviceToken();
      final response = await dio.post('$serverURL/api/assess', data: {
        'fashionSeq': fashionSeq,
        'like': true,
      });
      print(response.data);
      print('likeData');
      return response.data;
    } catch (e) {
      print(e);
      print('likeData');
      if (e is DioError) { // DioError를 확인
        _showErrorDialog('오류 발생: ${e.response?.statusCode}');
      } else {
        _showErrorDialog('알 수 없는 오류 발생');
      }
    }
  }

  Future<dynamic> hateData() async {
    Response response;
    try {
      // final deviceToken = getMyDeviceToken();
      final response = await dio.post('$serverURL/api/assess', data: {
        'fashionSeq': fashionSeq,
        'like': false,
      });
      print(response.data);
      print('hateData');
      return response.data;
    } catch (e) {
      print(e);
      print('hateData');
      if (e is DioError) { // DioError를 확인
        _showErrorDialog('오류 발생: ${e.response?.statusCode}');
      } else {
        _showErrorDialog('알 수 없는 오류 발생');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('오류 발생!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('확인'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 198, 197),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color(0xFFF5BEB5),
            expandedHeight: 55.0,
            floating: true,
            pinned: true,
            title: Text(
              '코디 평가',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            elevation: 0,
            leading: Text(''),
          ),
          SliverPadding(padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
            sliver: SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Text(
                              '싸피깔롱쟁이',
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
                              '님의 코디',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.chevron_left,
                            size: 40,
                            color: Color(0xFF54545b),),
                          Expanded(
                            child: Center(
                              child: cards.isEmpty
                                  ? Text('No more cards')
                                  : Dismissible(
                                key: Key(cards.first),
                                onDismissed: (direction) {
                                  // 오른쪽에서 왼쪽으로 스와이프한 경우 싫어요
                                  if (direction == DismissDirection.endToStart) {

                                    print('싫어요'); // 원하는 로직으로 대체
                                    dioData();
                                    hateData();
                                  }
                                  // 왼쪽에서 오른쪽으로 스와이프한 경우 좋아요
                                  else if (direction == DismissDirection.startToEnd) {
                                    print('좋아요'); // 원하는 로직으로 대체
                                    dioData();
                                    likeData();
                                  }

                                  setState(() {
                                    cards.removeAt(0);
                                  });
                                },
                                child: AspectRatio(
                                  aspectRatio: 3 / 5,
                                  child: Card(
                                    child: Image.network(
                                        cards.first,
                                        fit: BoxFit.cover,
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right,
                            size: 40,
                            color: Color(0xFF54545b),),
                        ],
                      ),
                      Center(
                        child: Image.asset('Assets/Image/swipe.png'),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}