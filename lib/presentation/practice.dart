import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:squadsyncweb/bussiness/entity/user.dart';
import 'package:squadsyncweb/common/data.dart';

class Practice extends StatelessWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String url =
              'https://squadsync-backend.azurewebsites.net/api/v0.1/login/squadsyncadmin';

          Map<String, String> requestBody = {
            'username': 'admin',
            'password': 'SquadSync@112!',
          };
          http.Response response = await http.post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: requestBody,
          );
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          print(responseBody);

          // return TokenResponse(
          //     access_token: responseBody['accesstoken'],
          //     status: response.statusCode,
          //     message: responseBody['message']);
          userTokenBox.add(UserToken(accessToken: responseBody['accesstoken']));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: userTokenBox.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: userTokenBox.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 200,
                  child: Text(userTokenBox.getAt(index)!.accessToken));
            },
          );
        },
      ),
    );
  }
}
