import 'package:flutter/material.dart';
import '../../../home/data/model/movie.dart';

class SearchResultsTile extends StatelessWidget {
  final Movie movie;
  const SearchResultsTile({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  movie.movieBackdrop,
                  height: 150,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              movie.movieName,
              overflow: TextOverflow.fade,
            ),
            trailing: Icon(
              Icons.more_horiz,
              color: Colors.blue.shade700,
            ),
          ),
          Divider(
            indent: 130,
            color: Colors.grey[400],
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
