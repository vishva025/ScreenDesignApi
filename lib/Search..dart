import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "StudentName": "Northen hills",
      "StudentEmail": "Warren87@yahoo.com",
      "StudentMobile": "266.325.4002 x787",
      "StudentParentMobile": "1-552-828-9074 x82648",
      "StudentImage": "https://previews.123rf.com/images/vitaliyvill/vitaliyvill1708/vitaliyvill170800030/84722223-cartoon-night-game-background-seamless-background-for-games-mobile-applications-and-computers-vector.jpg",
      "StudentDepartment": "Kids",
      "id": "1"
    },
    {
      "StudentName": "Marc",
      "StudentEmail": "Mafalda_Kihn@gmail.com",
      "StudentMobile": "593-296-3689 x9485",
      "StudentParentMobile": "(862) 529-6193 x49006",
      "StudentImage": "https://thumbs.dreamstime.com/b/beautiful-view-bedugul-bali-indonesia-tourism-very-famous-world-every-tourist-who-comes-to-will-definitely-travel-212270648.jpg",
      "StudentDepartment": "Books",
      "id": "2",
    },
    {
      "StudentName": "India Gate",
      "StudentEmail": "Alyson42@gmail.com",
      "StudentMobile": "(410) 459-0041",
      "StudentParentMobile": "1-528-904-1155 x3576",
      "StudentImage": "https://static.vecteezy.com/system/resources/previews/000/124/852/non_2x/free-india-gate-illustration-vector.jpg",
      "StudentDepartment": "Garden",
      "id": "3"
    },
    {
      "StudentName": "manas",
      "StudentEmail": "Claudine.Lakin@gmail.com",
      "StudentMobile": "1-694-304-1909 x49052",
      "StudentParentMobile": "(454) 783-1640 x45892",
      "StudentImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIqzZ2pWBlxC-uLOyiiQxBDkWs8zuVbGeQeg&usqp=CAU",
      "StudentDepartment": "Electronics",
      "id": "4"
    },
    {
      "StudentName": "Betty",
      "StudentEmail": "Brendan43@gmail.com",
      "StudentMobile": "806.648.8671 x5792",
      "StudentParentMobile": "1-957-957-8098 x70971",
      "StudentImage": "https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712__340.jpg",
      "StudentDepartment": "Health",
      "id": "5"
    },
    {
      "StudentName": "Carmela",
      "StudentEmail": "Marisol.Rau38@yahoo.com",
      "StudentMobile": "(565) 654-9538 x88482",
      "StudentParentMobile": "(316) 318-4046 x762",
      "StudentImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR37cf5u8RrtIYUUmnZwulq3_kAcdpaR-2PLg&usqp=CAU",
      "StudentDepartment": "Toys",
      "id": "6"
    },
    {
      "StudentName": "Fred",
      "StudentEmail": "Kaitlin_Corwin84@yahoo.com",
      "StudentMobile": "(716) 584-0998",
      "StudentParentMobile": "1-414-994-5941 x621",
      "StudentImage": "https://www.shutterstock.com/image-photo/narmadagujaratindianovember-24-2018tourists-visiting-worlds-260nw-1326446180.jpg",
      "StudentDepartment": "Electronics",
      "id": "7"
    },
    {
      "StudentName": "Jadon",
      "StudentEmail": "Rocky_Flatley74@hotmail.com",
      "StudentMobile": "547.819.6745 x1686",
      "StudentParentMobile": "1-345-300-2286 x2659",
      "StudentImage": "https://www.shutterstock.com/image-photo/temple-lord-shiva-somnath-gujarat-260nw-1095414812.jpg",
      "StudentDepartment": "Automotive",
      "id": "8"
    },
    {
      "StudentName": "Verlie",
      "StudentEmail": "Reba.Wilkinson51@gmail.com",
      "StudentMobile": "(376) 307-8966 x49221",
      "StudentParentMobile": "(895) 244-0539",
      "StudentImage": "https://cdn1.goibibo.com/voy_ing/t_fs/rajasthan-jaipur-148046447735o.jpeg",
      "StudentDepartment": "Garden",
      "id": "9"
    },
    {
      "StudentName": "Taj mahal",
      "StudentEmail": "Aniyah90@hotmail.com",
      "StudentMobile": "225-858-1848 x82145",
      "StudentParentMobile": "420.888.9322 x17034",
      "StudentImage": "https://res.klook.com/image/upload/c_fill,w_750,h_560/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/jdfjch8rinc3bmogkyuw.jpg",
      "StudentDepartment": "Baby",
      "id": "10"
    },
    {
      "StudentName": "Kedarnath",
      "StudentEmail": "Evie15@hotmail.com",
      "StudentMobile": "1-863-647-7686 x054",
      "StudentParentMobile": "939-342-1907 x442",
      "StudentImage": "https://www.shutterstock.com/image-photo/kedarnath-temple-2019-gorikund-uttrakhand-260nw-1760964392.jpg",
      "StudentDepartment": "Music",
      "id": "11"
    }
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["StudentName"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Travel Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
               onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                      NetworkImage(_foundUsers[index]['StudentImage']),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(_foundUsers[index]['StudentName']),
                  ),
                ),
              )
                  : const Text(
                'No results found Please try with diffrent search',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
