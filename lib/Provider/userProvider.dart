import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/getdata_model.dart';


class UserProvider extends ChangeNotifier {
  GetData? item;
  dynamic response;
  GetData? get getMovingData => item;

  get userData => null;

  Future<void> getMoviesData(
    BuildContext context,
  ) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString('x-auth-token');
      String Apis =
          "https://api.themoviedb.org/3/trending/all/day?api_key=39cf98d7db1ad3069227393fa6315d10";
      http.Response ApiRes = await http.get(
        Uri.parse(Apis),
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer $token'
        },
      );
      print(jsonEncode(jsonDecode(ApiRes.body)['results']));

      if (ApiRes.statusCode == 200) {
        response = json.decode(ApiRes.body);
        GetData _apiData;
        item = GetData.fromJson(response);
        log(item.toString());

        //  userInfo = GetData.fromJson(ApiRes.body);
        // await Provider.of<UserProvider>(context, listen: false)
        //     .addNewItem(userInfo);
        // UserProvider _user = Provider.of<UserProvider>(context, listen: false);
        // print('PROVIDER DATA : ' + _user.userData!.results[0].toString());
        //var userProvider = Provider.of<UserProvider>(context, listen: false);
        // userProvider.setUser(jsonEncode(jsonDecode(userRes.body)['response']));
        //  userProvider.setUser(jsonEncode(jsonDecode(ApiRes.body)['response']));
      }
    } catch (e) {
      //(context, e.toString());
    }
  }
}
