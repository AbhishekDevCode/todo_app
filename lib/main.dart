import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('TODO'),
        ),
        body: const Home(),
        //body part
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [];
  List<bool> checkboxs = [];
  List<DateTime> date = [];
  final myController = TextEditingController();

  get focusNode => null;
  void clearText() {
    myController.clear();
  }

  // List<bool> checkedValue = [false,false,false,false,false,false,false,false,false,false];
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text(
              'S.No',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.orange, fontSize: 15),
            ),
            SizedBox(
              width: 100,
            ),
            const Text(
              'Work Name',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.orange, fontSize: 15),
            ),
            SizedBox(
              width: 400,
            ),
            const Text(
              'TODO APP',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: 510,
            ),
            const Text(
              'Remove',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.orange, fontSize: 15),
            ),
          ],
        ),
        const Divider(
          height: 4,
          color: Colors.black,
        ),
        items.isEmpty
            ? Container(
                height: 200,
                width: 300,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'NO TASK TO DO',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: 350,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Text("${index + 1}"),
                            trailing: ElevatedButton(
                              child: const Text(
                                'DELETE',
                              ),
                              onPressed: () {
                                print('Pressed');
                                if (checkboxs[index] == true) {
                                  items.removeAt(index);
                                  checkboxs.removeAt(index);
                                } else {
                                  print('Not Deleted');
                                }
                                setState(() {});
                              },
                            ),
                            title: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(items[index]),
                              value: checkboxs[index],
                              onChanged: (val) {
                                setState(() {
                                  checkboxs[index] = val!;
                                });
                              },
                            ));
                      },
                    ),
                  ),
                ),
              ),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 500,
              ),
              Container(
                width: 150,
                child: TextField(
                  controller: myController,
                  onSubmitted: (val) {
                    print('Pressed');
                    items.add(val);
                    checkboxs.add(false);
                    clearText();
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter the Task',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    '+ADD',
                  ),
                  onPressed: () {
                    print('Pressed');
                    items.add(myController.text);
                    checkboxs.add(false);
                    clearText();
                    setState(() {});
                  },
                ),
              ),
              Container(
                //height: 40,
                width: 180,
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2060),
                    onDateChanged: (val) {
                      print('selected');
                      // date.add(value)
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
