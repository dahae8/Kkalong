import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
          theme: ThemeData(),
          home: Swipe()
      )
  );
}

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  final TextEditingController inputController = TextEditingController();

  List<String> cards = [
    'https://image.newsis.com/2022/07/08/NISI20220708_0001037503_web.jpg',
    'https://onlyyugioh.com/web/product/big/202205/5df59663bbd221d8148d3986fbe424c1.jpg',
    'https://image.zdnet.co.kr/2023/07/26/f7981bfffc284d23d6335b1223bd554c.jpg',
    'https://cdn.wwdkorea.com/news/photo/202305/4784_188109_5932.jpeg',
    'https://blog.kakaocdn.net/dn/3ZrbN/btqCJlADYIx/Y56IertbI9cyiKnRMK4ys1/img.png',

  ];

  var data = [];
  var imgUrl = '';
  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    // var result = await http.get(Uri.parse('http://k9c105.p.ssafy.io:8761/api/assess'));
    if (result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState(() {
        data = result2;
        // imgUrl = data['imgUrl'];
      });
      print('getData');
    } else {
      _showErrorDialog('오류 발생: ${result.statusCode}');
    }
  }

  likeData() async{
    var request = http.MultipartRequest('POST', Uri.parse('http://k9c105.p.ssafy.io:8761/api/assess'));

    request.fields['fashionSeq'] = '0';
    request.fields['like'] = 'true';
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var result = jsonDecode(responseString);
      setState(() {
        data = result;
      });
      print('likeData');
    } else {
      _showErrorDialog('오류 발생: ${response.statusCode}');
    }
  }

  hateData() async{
    var request = http.MultipartRequest('POST', Uri.parse('http://k9c105.p.ssafy.io:8761/api/assess'));

    request.fields['fashionSeq'] = '0';
    request.fields['like'] = 'false';
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var result = jsonDecode(responseString);
      setState(() {
        data = result;
      });
      print('hateData');
    } else {
      _showErrorDialog('오류 발생: ${response.statusCode}');
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5BEB5),
        toolbarHeight: 55,
        title: const Text(
          '코디평가',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        leading: const Text(''),
      ),
      body: Container(
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
        Center(
          child: cards.isEmpty
              ? Text('No more cards')
              : Dismissible(
            key: Key(cards.first),
            onDismissed: (direction) {
              // 오른쪽에서 왼쪽으로 스와이프한 경우 싫어요
              if (direction == DismissDirection.endToStart) {

                print('싫어요'); // 원하는 로직으로 대체
                getData();
              }
              // 왼쪽에서 오른쪽으로 스와이프한 경우 좋아요
              else if (direction == DismissDirection.startToEnd) {
                print('좋아요'); // 원하는 로직으로 대체
                getData();
              }

              setState(() {
                cards.removeAt(0);
              });
            },
            child: Card(
              child: Container(
                height: 300,
                width: 200,
                alignment: Alignment.center,
                child: Image.network(
                  cards.first,
                  fit: BoxFit.cover,
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
                child: Image.asset('assets/swipe.png'),
              ),
            ],
          )),
    );
  }
}