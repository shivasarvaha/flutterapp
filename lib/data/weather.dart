class Weather {
  String name = '';
  String description = '';
  double temprature = 0;
  double perceievd = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temprature, this.perceievd,
      this.pressure, this.humidity);
  Weather.fromJson(Map<String, dynamic> weatherMap) {
    this.name = weatherMap['name'];
    this.description = weatherMap['weather'][0]['description'] ?? '';
    //this..temprature = (weatherMap['main']['temp'] * 9/5 - 459.67) ?? 0;
    this.temprature = (weatherMap['main']['temp'] - 273.5) ?? 0;
    this.perceievd = (weatherMap['main']['feels_like'] - 273.5) ?? 0;
    this.pressure = weatherMap['main']['pressure'] ?? 0;
    this.humidity = weatherMap['main']['humidity'] ?? 0;
  }
}
