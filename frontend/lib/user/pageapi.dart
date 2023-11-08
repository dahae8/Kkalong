import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PageApi {
  final Dio dio = Dio(); // Dio HTTP 클라이언트 초기화
  final serverURL = 'http://k9c105.p.ssafy.io:8761';

  Future<dynamic> login(id, password) async {
    try {
      // final deviceToken = getMyDeviceToken();
      final response = await dio.post('$serverURL/api/member/login', data: {
        'memberId': id,
        'memberPw': password,
      });
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  // Future<dynamic> duplicatecheck(id) async {
  //   try {
  //     final response = await dio.get('$serverURL/user/checkemail',
  //         queryParameters: {'userEmail': id});
  //     print(response.data);
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> sendEmail(id) async {
  //   try {
  //     final response = await dio
  //         .post('$serverURL/user/auth/sendEmail', data: {'userEmail': id});
  //     print(response.data);
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> checkcode(id, code) async {
  //   try {
  //     final response = await dio.post('$serverURL/user/auth/checkEmail/$code',
  //         data: {'userEmail': id}, queryParameters: {'code': code});
  //     print('코드 확인 여부 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> signup(
  //     id, pwd, birth, gender, vegan, alergylist, deviceToken) async {
  //   try {
  //     final response = await dio.post('$serverURL/user/signup', data: {
  //       'userEmail': id,
  //       'userPwd': pwd,
  //       'userBirthday': birth,
  //       'userGender': gender,
  //       'veganId': vegan,
  //       'allergyList': alergylist,
  //       'notiToken': deviceToken
  //     });
  //     print('회원가입 여부 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<dynamic> getinfo(token) async {
  //   print(token);
  //   print(token.runtimeType);
  //   try {
  //     final response = await dio.post('$serverURL/user/mypage',
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token', // 토큰을 'Bearer' 스타일로 포함
  //             // 다른 헤더도 필요한 경우 여기에 추가할 수 있습니다.
  //           },
  //         ));
  //     print('개인정보 조회 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<dynamic> updateuserinfo(
  //     token, selectedVeganNumber, selectedAllergieNumber) async {
  //   try {
  //     final response = await dio.put('$serverURL/user',
  //         data: {
  //           'veganId': selectedVeganNumber,
  //           'allergyList': selectedAllergieNumber
  //         },
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token', // 토큰을 'Bearer' 스타일로 포함
  //             // 다른 헤더도 필요한 경우 여기에 추가할 수 있습니다.
  //           },
  //         ));
  //     print('유저 정보 수정 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<dynamic> findPassword(id, birth) async {
  //   try {
  //     final response = await dio.post('$serverURL/user/find/pwd',
  //         data: {'userBirthday': birth, 'userEmail': id});
  //     print('비밀번호 찾기 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<dynamic> changepassword(token, curpwd, nextpwd) async {
  //   try {
  //     final response = await dio.post('$serverURL/user/pwd',
  //         data: {'curpassword': curpwd, 'nextpassword': nextpwd},
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token', // 토큰을 'Bearer' 스타일로 포함
  //             // 다른 헤더도 필요한 경우 여기에 추가할 수 있습니다.
  //           },
  //         ));
  //     print('비밀번호 변경 ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Future<dynamic> logout(token) async {
  //   try {
  //     final response = await dio.post('$serverURL/user/signout',
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token', // 토큰을 'Bearer' 스타일로 포함
  //             // 다른 헤더도 필요한 경우 여기에 추가할 수 있습니다.
  //           },
  //         ));
  //     print('로그아웃 api ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<dynamic> tokenValidation(token) async {
    try {
      final response = await dio.post('$serverURL/api/member/auth/checktoken',
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      print('토큰유효 api ${response.data}');
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<dynamic> deleteuser(token, id) async {
  //   try {
  //     final response = await dio.delete('$serverURL/user',
  //         data: {"userEmail": id},
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token', // 토큰을 'Bearer' 스타일로 포함
  //             // 다른 헤더도 필요한 경우 여기에 추가할 수 있습니다.
  //           },
  //         ));
  //     print('회원탈퇴 api ${response.data}');
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
