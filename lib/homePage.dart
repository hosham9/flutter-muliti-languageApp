import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multlange/localization_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String lng ;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    lng=LocalizationService().getCreentLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter mulit lang"),
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(child: _uiWidget()),
    );
  }

  Widget _uiWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'hello_title'.tr,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(" "),
            new DropdownButton<String>(
                items: LocalizationService.langs.map(
                        (String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                },
                ).toList(),
              value: this.lng,
              underline: Container(color: Colors.transparent,),
              isExpanded: false,
              onChanged: (newVal){
                setState(() {
                  this.lng= newVal!;
                  LocalizationService().changeLocate(newVal);
                });
              },

            )
          ],
        )
      ],
    );
  }
}
