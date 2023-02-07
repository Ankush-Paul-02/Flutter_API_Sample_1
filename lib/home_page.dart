import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePost> samplePost = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          // snapshot = check data receive or not
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: samplePost.length,
                itemBuilder: (context, index) => Container(
                      height: 130,
                      color: const Color(0xffd8323c),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "User id: ${samplePost[index].userId}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "id: ${samplePost[index].id}",
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "title: ${samplePost[index].title}",
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "body: ${samplePost[index].body}",
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<SamplePost>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // if response successfully process
      for (Map<String, dynamic> index in data) {
        samplePost.add(SamplePost.fromJson(index));
      }
      return samplePost;
    } else {
      return samplePost;
    }
  }
}
