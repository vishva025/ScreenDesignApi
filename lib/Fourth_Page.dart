import 'package:api_screen_design/Second_Page.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image(
              image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/beautiful-view-bedugul-bali-indonesia-tourism-very-famous-world-every-tourist-who-comes-to-will-definitely-travel-212270648.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              height: 30,
              width: 100,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(
                      MaterialPageRoute(builder: (context) {
                        return SecondPage();
                      }));
                },
                child: Row(
                  children: [
                    Expanded(child: Container(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      ),
                    )),
                    Expanded(child: Container(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                          FontWeight
                              .bold,
                          fontSize: 15,
                          fontFamily:
                          'Merriweather',
                        ),
                      ),
                    )),
                  ],
                ),
              ),

            ),
          ),
          Stack(
            children: [
              Container(
                height: 700,
                width: double.infinity,
                margin: EdgeInsets.only(top: 300),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Expanded(
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  top: 13,
                                                                  left: 5),
                                                              child: Text(
                                                                'Pura Ulun Danu',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                  'Merriweather',
                                                                  color:
                                                                  Colors.black,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 2),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                child: Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  color: Color.fromRGBO(11, 110, 102, 0.8),
                                                                  size: 15,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                child: Text(
                                                                  'North Ball, Indonesia',
                                                                  textAlign:
                                                                  TextAlign
                                                                      .start,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      15,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ),
                                                              flex: 4,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              flex: 3,
                                            ),
                                            Expanded(child: Container()),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.only(
                                                                top: 10, bottom: 10),
                                                            decoration: BoxDecoration(
                                                                color: Color.fromRGBO(
                                                                    158, 230, 224, 0.9),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(10)),
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons
                                                                  .thermostat_auto_rounded,
                                                              color: Color.fromRGBO(
                                                                  11, 110, 102, 0.8),
                                                              size: 30,
                                                            ),
                                                          )),
                                                      Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.only(
                                                                top: 10, bottom: 10),
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                    child: Container(
                                                                      child: Text(
                                                                        'Temp',
                                                                        textAlign:
                                                                        TextAlign.end,
                                                                        style: TextStyle(
                                                                            fontSize: 15,
                                                                            color: Colors
                                                                                .grey),
                                                                      ),
                                                                    )),
                                                                Expanded(
                                                                    child: Container(
                                                                      child: Text(
                                                                        "32' C",
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontSize: 20,
                                                                            color: Colors
                                                                                .black),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                            Expanded(
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.only(
                                                                top: 10, bottom: 10),
                                                            decoration: BoxDecoration(
                                                                color: Color.fromRGBO(
                                                                    158, 230, 224, 0.9),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(10)),
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons
                                                                  .location_on,
                                                              color: Color.fromRGBO(
                                                                  11, 110, 102, 0.8),
                                                              size: 30,
                                                            ),
                                                          )),
                                                      Expanded(
                                                          child: Container(
                                                            margin: EdgeInsets.only(
                                                                top: 10, bottom: 10),
                                                            child: Column(
                                                              children: [
                                                                Expanded(
                                                                    child: Container(
                                                                      child: Text(
                                                                        'Distance',
                                                                        textAlign:
                                                                        TextAlign.end,
                                                                        style: TextStyle(
                                                                            fontSize: 15,
                                                                            color: Colors
                                                                                .grey),
                                                                      ),
                                                                    )),
                                                                Expanded(
                                                                    child: Container(
                                                                      child: Text(
                                                                        "12 km",
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontSize: 20,
                                                                            fontFamily:
                                                                            'Merriweather',
                                                                            color: Colors
                                                                                .black),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Expanded(child: Container(
                                                child: Text(
                                                  'Description',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Merriweather',
                                                  ),
                                                ),
                                              )),
                                              Expanded(child: Container(
                                                child: Text(
                                                  'Reviews',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Merriweather',
                                                  ),
                                                ),
                                              )),
                                              Expanded(child: Container(
                                                child: Text(
                                                  'Comments',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'Merriweather',
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                            'Lorem ipsum dolor sit amet. Hic eveniet unde sed maiores nulla hic asperiores labore. A libero facilis a fuga similique vel officiis nobis eum sunt aliquid. Non dolor amet et eligendi sunt est enim dignissimos vel vero repellat 33 atque recusandae non voluptates animi cum expedita amet.'
                                        ),
                                      ),
                                      flex: 3,
                                    ),
                                  ],
                                ),
                              ),
                              flex: 15,
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(8, 120, 111, 0.9),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    margin:
                                    EdgeInsets.only(top: 15, left: 20, bottom: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Starting from',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$450/',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              'person',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  child: Container(
                                    height: 40,
                                    margin: EdgeInsets.only(left: 20, right: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Merriweather',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 275,
                right: 40,
                child: Container(
                  height: 50,
                  width: 50,
                  //margin: EdgeInsets.only(top: 275,right: 500),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 1.5, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}