import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/Weather_Model.dart';
import 'package:weather_app/services/weather_Services.dart';

import '../provider/weather_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class SearchPage extends StatelessWidget {
  VoidCallback? updateUi;
  SearchPage({this.updateUi});
  String? cityNamee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextFormField(
            onChanged: ((value) {
              cityNamee = value;
            }),
            onFieldSubmitted: (value) async {
              cityNamee = value;
              WeatherServices service = WeatherServices();
              WeatherModel? weatherr =
                  await service.getWeather(cityName: cityNamee!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherr;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityNamee;
                  if (  Provider.of<WeatherProvider>(context, listen: false).weatherData ==null) {
           Alert(
          context:(context),
          type: AlertType.error,
          title:"Wrong input",
          desc:"No info about city you have to search" ,
          buttons: [
            DialogButton(
              child: const Text(
                "search new",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        
      }

              //updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                label: const Text("Search"),
                suffixIcon: IconButton(
                  onPressed: () async {
                    WeatherServices service = WeatherServices();
                    WeatherModel? weatherr =
                        await service.getWeather(cityName: cityNamee!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weatherr;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityNamee;

                    //updateUi!();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(),
                hintText: "Enter a city",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
    );
  }
}
