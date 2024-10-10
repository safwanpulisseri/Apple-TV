import 'package:apple_tv/feature/home/data/service/remote/movie_data.dart';
import 'package:apple_tv/feature/search/data/service/remote/search_data.dart';
import 'package:apple_tv/feature/search/view/widget/search_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../home/data/model/movie.dart';

TextEditingController searchController = TextEditingController();

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchContent = '';
  late Future<List<Movie>> searchResults;

  @override
  void initState() {
    super.initState();
    searchResults = MovieData().getTrendingMovies();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              'Search',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            radius: 17,
            backgroundColor: Colors.grey,
            child: Text('S', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextField(
                          cursorColor: Colors.black,
                          //autofocus: true,
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchMovies(value);
                            });
                          },
                          decoration: InputDecoration.collapsed(
                              hintText: 'Shows, Movies and More',
                              hintStyle: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400)),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.grey[600],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: searchResults,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  const Flexible(child: Center(child: CircularProgressIndicator.adaptive()));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                return const Flexible(
                  child:  Center(
                    child: Text('No search results'),
                  ),
                );
              } else {
                List<Movie> searchResults = snapshot.data as List<Movie>;
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchResultsTile(
                        movie: searchResults[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: searchResults.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _searchMovies(String value) async {
    try {
      List<Movie> results = await SearchingData().getSearchingMovies(value);
      setState(() {
        if (kDebugMode) {
          print('function started...');
        }
        searchResults = Future.value(results);
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error searching movies: $e');
      }
    }
  }
}
