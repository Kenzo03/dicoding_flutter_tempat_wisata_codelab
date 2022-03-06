import 'package:flutter/material.dart';
import './detail_screen.dart';
import './model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                'Wisata Bandung. Size: ${MediaQuery.of(context).size.width}')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return const TourismPlaceList();
            } else {
              return const TourismPlaceGrid();
            }
          },
        ));
  }
}

class TourismPlaceGrid extends StatelessWidget {
  const TourismPlaceGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.count(
            crossAxisCount: 4,
            children: tourismPlaceList.map((place) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(place: place);
                    }));
                  },
                  child: Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child:
                              Image.asset(place.imageAsset, fit: BoxFit.cover)),
                      const SizedBox(height: 8),
                      Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(place.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(place.location))
                    ],
                  )));
            }).toList()));
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tourismPlaceList.length,
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];

        return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:
                        Hero(tag: 'img', child: Image.asset(place.imageAsset)),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(place.name,
                                  style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 10),
                              Text(place.location)
                            ],
                          ))),
                ])));
      },
    );
  }
}
