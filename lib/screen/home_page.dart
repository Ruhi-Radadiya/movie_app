import 'package:flutter/material.dart';
import 'package:movie_app/controller/moviecontroller.dart';
import 'package:movie_app/helper/moviehelper.dart';
import 'package:movie_app/models/moviemodel.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

TextEditingController movieController = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MOVIES",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.save),
            child: const Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: movieController,
                    cursorColor: Colors.black,
                    cursorWidth: 2,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FloatingActionButton(
                    backgroundColor: Colors.brown[100],
                    shape: StadiumBorder(),
                    onPressed: () {
                      Provider.of<Moviecontroller>(context, listen: false)
                          .getData(
                        movie: movieController.text,
                      );
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<Moviecontroller>(builder: (context, provider, _) {
                return FutureBuilder(
                  future: provider.getMovie(),
                  builder: (BuildContext context, AsyncSnapshot snapShop) {
                    if (snapShop.hasError) {
                      return Center(
                        child: Text("Error: ${snapShop.error}"),
                      );
                    } else if (snapShop.hasData) {
                      List<Search> movies = snapShop.data;
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.detail);
                        },
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 7,
                            childAspectRatio: 0.5,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () async {
                              Moviehelper.moviehelper
                                  .getSingleMoviedata(
                                      movie: movies[index].title)
                                  .then(
                                (value) {
                                  Navigator.pushNamed(context, Routes.detail,
                                      arguments: value);
                                },
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          movies[index].poster,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${movies[index].title}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${movies[index].year}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: movies.length,
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
