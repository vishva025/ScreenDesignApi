import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Insert extends StatefulWidget{

  Insert(this.map);
  Map? map;

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var imageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.map == null ? '' : widget.map!['StudentName'];
    imageController.text = widget.map == null ? '' : widget.map!['StudentImage'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Row(
          children: [
            Expanded(child: Container()),
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Name'
                    ),
                    validator: (value) {
                      if(value!=null && value.isEmpty){
                        return "Please enter name";
                      }
                    },
                    controller: nameController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Image'
                    ),
                    validator: (value) {
                      if(value!=null && value.isEmpty){
                        return "Please enter imageUrl";
                      }
                    },
                    controller: imageController,
                  ),

                  Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(8, 120, 111, 0.9),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            if (widget.map == null) {
                              insertUser()
                                  .then((value) => Navigator.of(context).pop(true));
                            } else {
                              updateuser(widget.map!['id'])
                                  .then((value) => Navigator.of(context).pop(true));
                            }
                          }
                        },
                        child: Text('Submit',style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),)),
                  )
                ],
              ),
            ),flex: 15,),
            Expanded(child: Container()),
          ],
        ),
      ),

    );
  }

  Future<void> updateuser(id) async {
    Map map = {};
    map["StudentName"] = nameController.text;
    map["StudentImage"] = imageController.text;
    var res1 = await http.put(
        Uri.parse('https://630c4c7853a833c534274e17.mockapi.io/Students/$id'),
        body: map);
    print(res1.body);
  }

  Future<void> insertUser() async {
    Map map = {};
    map["StudentName"] = nameController.text;
    map["StudentImage"] = imageController.text;

    var res1 = await http
        .post(
        Uri.parse("https://630c4c7853a833c534274e17.mockapi.io/Students"),body: map);
    print(res1.body);
  }
}