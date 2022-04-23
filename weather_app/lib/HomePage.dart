import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';

import 'provider/weather_provider.dart';
import 'screens/Search.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel? weaherData =
        Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontSize: 20),
        ),
        //leading: const Icon(Icons.sunny),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage(
                      updateUi: updateUi,
                    );
                  },
                ));
              },
              icon: const Icon(Icons.search))
        ],
        /* flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 224, 43, 31),
            Color.fromARGB(255, 167, 137, 5),
            Color.fromARGB(255, 182, 122, 10),
          ])),
        ),*/
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    " search for a city now",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.sunny,
                    size: 30,
                    color: Colors.amber,
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weaherData!.getThemeColor()!,
                weaherData.getThemeColor()!.shade200,
                weaherData.getThemeColor()!.shade100,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName!,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Updated at : ${ weaherData.date.hour.toString()}:${weaherData.date.minute.toString()} ",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weaherData.getImage()),
                          Text(
                            weaherData.temp.toInt().toString(),
                            style: TextStyle(fontSize: 35),
                          ),
                          Column(
                            children: [
                              Text(
                                  "Min temp:${ weaherData.minTemp.toInt().toString()}",
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                "Max temp:${ weaherData.maxTemp.toInt().toString()}",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      weaherData.weatherStateName,
                      style: TextStyle(fontSize: 35),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
