import 'dart:convert';

import 'package:api_screen_design/Fifth_Page.dart';
import 'package:api_screen_design/Fourth_Page.dart';
import 'package:api_screen_design/Insert.dart';
import 'package:api_screen_design/Search..dart';
import 'package:api_screen_design/Third_Page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  String? Name;

  SecondPage({this.Name});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  void initState() {
    super.initState();
    callEntriesApi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'Hii,',
                                    textAlign: TextAlign.start,
                                  ),
                                )),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      widget.Name!,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  flex: 5,
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(left: 50),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(160),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'data:image/png;base64,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'),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Let's start \nyour vacation !",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Merriweather',
                                ),
                              ),
                            ),
                            flex: 4,
                          ),
                          Expanded(child: Container()),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: TextField(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return SearchBarScreen();
                                    }));
                              },
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  hintText: "Search here...",
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                            child: Container(
                          margin:
                              EdgeInsets.only(bottom: 15, left: 10, right: 10),
                          height: 47,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(11, 110, 102, 0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.adjust,
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(11, 110, 102, 0.8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(
                                    Icons.flight_takeoff_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'Flight',
                                    style: TextStyle(
                                      fontFamily: 'Merriweather',
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(158, 230, 224, 0.9),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.hotel,
                                    color: Color.fromRGBO(11, 110, 102, 0.8),
                                    size: 30,
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'Hotel',
                                    style: TextStyle(
                                      fontFamily: 'Merriweather',
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(158, 230, 224, 0.9),
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10),
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.directions_bus,
                                    color: Color.fromRGBO(11, 110, 102, 0.8),
                                    size: 30,
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  child: Text(
                                    'Bus',
                                    style: TextStyle(
                                      fontFamily: 'Merriweather',
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) {
                                          return Insert(null);
                                        })).then((value) {
                                          if(value==true) {
                                            setState(() {

                                            });
                                          }
                                        },);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(158, 230, 224, 0.9),
                                        borderRadius: BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 10, right: 10),
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(11, 110, 102, 0.8),
                                      size: 30,
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      'Add User',
                                      style: TextStyle(
                                        fontFamily: 'Merriweather',
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                      child: Container(
                    height: 50,
                    padding: EdgeInsets.only(bottom: 50),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Text(
                            'Trend',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Merriweather',
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Text(
                            'Featured',
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          child: Text(
                            'Top Visited',
                            style: TextStyle(
                              fontFamily: 'Merriweather',
                            ),
                          ),
                        )),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 400,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: FutureBuilder<http.Response>(
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:jsonDecode(snapshot.data!.body.toString()).length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ThirdPage(jsonDecode(snapshot.data!.body.toString())[index]['StudentImage'],
                                                    jsonDecode(snapshot.data!.body.toString())[index]['StudentName']
                                                );
                                              }));
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        height: 200,
                                                        width: 200,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(jsonDecode(snapshot
                                                                          .data!
                                                                          .body
                                                                          .toString())[index]
                                                                      [
                                                                      'StudentImage']),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                        //child: Image.network(jsonDecode(snapshot.data!.body.toString())[index]['StudentImage']),
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(left: 5),
                                                              width: 100,
                                                              child: Text(
                                                                jsonDecode(snapshot
                                                                        .data!.body
                                                                        .toString())[index]
                                                                    [
                                                                    'StudentName'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: 'Merriweather',
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(4.0),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Color.fromRGBO(158, 230, 224, 0.9),
                                                                          borderRadius: BorderRadius.circular(10)),
                                                                      margin: EdgeInsets.only(
                                                                          top: 5, bottom: 5, right: 5,left: 5),
                                                                      height: 35,
                                                                      width: 35,
                                                                      child: IconButton(
                                                                        onPressed: () {
                                                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                                                            return Insert(jsonDecode(snapshot.data!.body.toString())[index]);
                                                                          },)).then((value) {
                                                                            if(value== true){
                                                                              setState(() {

                                                                              });
                                                                            }
                                                                          });
                                                                        },
                                                                        icon: Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color: Colors
                                                                              .white,
                                                                          size: 25,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Color.fromRGBO(158, 230, 224, 0.9),
                                                                          borderRadius: BorderRadius.circular(10)),
                                                                      margin: EdgeInsets.only(
                                                                          top: 5, bottom: 5),
                                                                      height: 35,
                                                                      width: 35,
                                                                      child: IconButton(
                                                                        onPressed: () {
                                                                          showAlert(jsonDecode(
                                                                              snapshot
                                                                                  .data!.body
                                                                                  .toString())[
                                                                          index]['id']);
                                                                        },
                                                                        icon: Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color: Colors
                                                                              .white,
                                                                          size: 25,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                                future: callEntriesApi()),
                          )
                        ],
                      ),
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            flex: 8,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  void showAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert!'),
          content: Text('Are you sure want to delete?'),
          actions: [
            TextButton(
                onPressed: () async {
                  http.Response res=await deleteData(id);
                  if(res.statusCode==200){
                    Navigator.of(context).pop();
                    setState(() {

                    });
                  }
                },
                child: Text('yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'))
          ],
        );
      },
    );
  }

  Future<http.Response> deleteData(id) async {
    var response = await http.delete(
        Uri.parse('https://630c4c7853a833c534274e17.mockapi.io/Students/$id'));
    return response;
  }

  Future<http.Response> callEntriesApi() async {
    var res = await http
        .get(Uri.parse("https://630c4c7853a833c534274e17.mockapi.io/Students"));

    return res;
  }
}
