import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/controller/homescreencontroller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Provider.of<Homescreencontroller>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenstate = Provider.of<Homescreencontroller>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: homescreenstate.responseModels?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homescreenstate.responseModels?[index].id.toString() ??
                          "",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      homescreenstate.responseModels?[index].userId
                              .toString() ??
                          "",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      homescreenstate.responseModels?[index].title ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      homescreenstate.responseModels?[index].body ?? "",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text("data"),
                    // Add more widgets here if needed
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
