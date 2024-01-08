import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_feed/response_model.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewsFeedState();
  }
}

class _NewsFeedState extends State<NewsFeed> {
  bool isLoading = true;
  String url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=ADD_YOUR_KEY_HERE";

  List<Articles> articlesList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log(" ApiRequest Response : ${json.decode(response.body)}");
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final Response apiResponse = Response.fromJson(jsonResponse);

        setState(() {
          isLoading = false;
          articlesList = apiResponse.articles ?? [];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'News Feed',
            style: TextStyle(
                fontFamily: AutofillHints.name,
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: articlesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      borderOnForeground: true,
                      color: const Color.fromARGB(255, 238, 240, 241),
                      margin: const EdgeInsets.only(
                          right: 10, top: 10, bottom: 4, left: 10),
                      elevation: 4,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image(
                                      image:
                                          AssetImage('assets/Images/news.jpg'),
                                    ),
                                  ),
                                  Text(
                                    articlesList[index].author != null ||
                                            articlesList[index]
                                                    .author
                                                    ?.isEmpty ==
                                                true
                                        ? articlesList[index].author!
                                        : 'Title',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(articlesList[index].title != null ||
                                          articlesList[index].title?.isEmpty ==
                                              true
                                      ? articlesList[index].title!
                                      : 'Description'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
