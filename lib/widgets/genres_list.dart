import 'package:flutter/material.dart';
import 'package:thmoviedb/model/genre.dart';
import 'package:thmoviedb/style/theme.dart' as Style;
import 'package:thmoviedb/widgets/genres_movie.dart';

class GenresList extends StatefulWidget {
  final List<Genre> genres;

  const GenresList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  TabController _tabController;
  _GenresListState(this.genres);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: Style.Colors.mainColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor: Style.Colors.mainColor,
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Style.Colors.secondColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3.0,
                    unselectedLabelColor: Style.Colors.titleColor,
                    labelColor: Colors.white,
                    isScrollable: true,
                    tabs: genres.map((Genre genre) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                        child: Text(
                          genre.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      );
                    }).toList(),
                  ),
                )),
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: genres.map((Genre genre) {
                return GenreMovies(genreId: genre.id);
              }).toList(),
            ),
          )),
    );
  }
}
