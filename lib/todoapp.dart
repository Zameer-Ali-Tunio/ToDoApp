import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = '';
  List<dynamic> lst = ['Break Fast', 'Meeting With Ali'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'TodoApp',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            Icon(
              Icons.add,
              size: 35,
            ),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images2.minutemediacdn.com/image/upload/c_crop,h_2164,w_3845,x_0,y_259/f_auto,q_auto,w_1100/v1554918405/shape/mentalfloss/94735-istock-863607936.jpg"),
                  fit: BoxFit.cover)),
          child: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 50,
                    color: Colors.lightBlueAccent,
                    margin: EdgeInsets.only(top: 5),
                    child: ListTile(
                        title: Text("${lst[index]}"),
                        trailing: Container(
                          width: 50,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Item'),
                                            content: TextField(
                                              onChanged: (value) {
                                                output = value;
                                              },
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      lst.replaceRange(index,
                                                          index + 1, {output});
                                                    });
                                                  },
                                                  child: Text('Edit'))
                                            ],
                                          );
                                        });
                                  },
                                  child: Icon(Icons.edit)),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      lst.removeAt(index);
                                    });
                                  },
                                  child: Icon(Icons.delete)),
                            ],
                          ),
                        )));
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add Item'),
                    content: TextField(
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              lst.add(output);
                            });
                          },
                          child: Text('Add'))
                    ],
                  );
                });
          },
          child: Text("Add"),
        ),
      ),
    );
  }
}
