class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double tempMin;
  final double tempMax;
  final double windSpeed;
  final double humidity;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.tempMin,
    required this.tempMax,
    required this.windSpeed,
    required this.humidity
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"], 
      temperature: json["main"]["temp"].toDouble(), 
      mainCondition: json["weather"][0]["main"],
      tempMin: json["main"]["temp_min"].toDouble(),
      tempMax: json["main"]["temp_max"].toDouble(),
      windSpeed: json["wind"]["speed"].toDouble(),
      humidity: json["main"]["humidity"].toDouble()
    );
  }
}