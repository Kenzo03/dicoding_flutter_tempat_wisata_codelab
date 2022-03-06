import 'package:codelab1_tempat_wisata/model/tourism_place.dart';
import 'package:flutter/material.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('Lembang Farm House')),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(place.imageAsset),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(place.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontFamily: 'Staatliches'))),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(height: 8),
                              Text(
                                place.openDays,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(height: 8),
                              Text(
                                place.openTime,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.monetization_on),
                              SizedBox(height: 8),
                              Text(
                                place.ticketPrice,
                                style: informationTextStyle,
                              )
                            ],
                          )
                        ])),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Text(place.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontFamily: 'Oxygen'))),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: place.imageUrls.map((url) {
                      return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ));
                    }).toList(),
                  ),
                ),
              ]),
        ));
  }
}
