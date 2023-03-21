import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

import 'movie_ui/movie_ui.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Shadow & Bone",
    "Titanic",
    "Avatar 2",
    "Kingdom",
    "Sweet home",
    "Parasite",
    "Stranger things",
    "Lord of Rings",
    "Frozen",
    "Tomb Rider",
    "Jumanji 2",
    "All of us are dead"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              Positioned(child: movieCard(movieList[index], context)),
              Positioned(top: 15, child: movieImage(movieList[index].images[0]))
            ]);
            // return Card(
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: NetworkImage(movieList[index].images[0]),
            //               fit: BoxFit.cover
            //             ),
            //             borderRadius: BorderRadius.circular(5)
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("..."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[index].title}"),
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(
            //           builder: (context) => MovieListViewDetails(movie: movieList[index],)));
            //     },
            //     //onTap: ()=>debugPrint("Name: ${movies[index]}"),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "${movie.title}",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating}/10",
                        style: mainTextStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.runtime,
                        style: mainTextStyle(),
                      ),
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(movie: movie)))
      },
    );
  }

  Widget movieImage(String url) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(url ??
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-library.com%2Ficon%2Fnone-icon-1.html&psig=AOvVaw1c55lfIOc9upTCOHJ4MkgD&ust=1679386489627000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOjd1qyI6v0CFQAAAAAdAAAAABAd'),
              fit: BoxFit.cover)),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15, color: Colors.grey);
  }
}

//second route


