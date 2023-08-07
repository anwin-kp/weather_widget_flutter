import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// A map of weather conditions to icons and colors
final Map<String, List<dynamic>> weatherIcons = {
  //! Clear
  'clear sky': [
    CupertinoIcons.sun_max,
    CupertinoColors.systemGrey,
  ],
  //! Clouds
  'few clouds': [
    CupertinoIcons.cloud_sun,
    CupertinoColors.systemGrey,
  ],
  'scattered clouds': [
    CupertinoIcons.cloud,
    CupertinoColors.systemGrey,
  ],
  'broken clouds': [
    CupertinoIcons.cloud_drizzle,
    CupertinoColors.systemGrey,
  ],
  'overcast clouds': [
    CupertinoIcons.cloud_fill,
    CupertinoColors.systemGrey,
  ],
  //! Thunderstorm
  'thunderstorm with light rain': [
    CupertinoIcons.cloud_bolt_rain,
    CupertinoColors.systemGrey,
  ],
  'thunderstorm with rain': [
    CupertinoIcons.cloud_bolt_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'thunderstorm with heavy rain': [
    CupertinoIcons.cloud_bolt_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'light thunderstorm': [
    CupertinoIcons.cloud_bolt_rain,
    CupertinoColors.systemGrey,
  ],
  'thunderstorm': [
    CupertinoIcons.cloud_bolt_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'heavy thunderstorm': [
    CupertinoIcons.cloud_bolt_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'ragged thunderstorm': [
    CupertinoIcons.cloud_drizzle,
    CupertinoColors.systemGrey,
  ],
  'thunderstorm with light drizzle': [
    CupertinoIcons.cloud_drizzle_fill,
    CupertinoColors.systemGrey,
  ],
  //! Drizzle
  'light intensity drizzle': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  'drizzle': [
    CupertinoIcons.cloud_drizzle_fill,
    CupertinoColors.systemGrey,
  ],
  'heavy intensity drizzle': [
    CupertinoIcons.cloud_drizzle_fill,
    CupertinoColors.systemGrey,
  ],
  'light intensity drizzle rain': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  'drizzle rain': [
    CupertinoIcons.cloud_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'heavy intensity drizzle rain': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'shower rain and drizzle': [
    CupertinoIcons.cloud_drizzle_fill,
    CupertinoColors.systemGrey,
  ],
  'heavy shower rain and drizzle': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'shower drizzle': [
    CupertinoIcons.cloud_drizzle_fill,
    CupertinoColors.systemGrey,
  ],
  //! Rain
  'light rain': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  'moderate rain': [
    CupertinoIcons.cloud_rain_fill,
    CupertinoColors.systemGrey,
  ],
  'heavy intensity rain': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'very heavy rain': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'extreme rain': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'freezing rain': [
    CupertinoIcons.cloud_snow,
    CupertinoColors.systemGrey,
  ],

  '	light intensity shower rain': [
    CupertinoIcons.cloud_heavyrain_fill,
    CupertinoColors.systemGrey,
  ],
  'shower rain': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  'heavy intensity shower rain': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  '	ragged shower rain': [
    CupertinoIcons.cloud_rain,
    CupertinoColors.systemGrey,
  ],
  //! Snow
  'light snow': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'snow': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'heavy snow': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'sleet': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'light shower sleet': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'shower sleet': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'light rain and snow': [
    CupertinoIcons.snow,
    CupertinoColors.systemGrey,
  ],
  'rain and snow': [
    CupertinoIcons.cloud_snow,
    CupertinoColors.systemGrey,
  ],
  'light shower snow': [
    CupertinoIcons.cloud_snow,
    CupertinoColors.systemGrey,
  ],
  'shower snow': [
    CupertinoIcons.cloud_snow,
    CupertinoColors.systemGrey,
  ],
  '	heavy shower snow': [
    CupertinoIcons.cloud_snow_fill,
    CupertinoColors.systemGrey,
  ],
  //! Atmosphere
  'mist': [
    CupertinoIcons.cloud_fog,
    CupertinoColors.systemGrey,
  ],
  'smoke': [
    CupertinoIcons.cloud_fog,
    CupertinoColors.systemGrey,
  ],
  'haze': [
    CupertinoIcons.sun_haze,
    CupertinoColors.systemGrey,
  ],
  'sand/dust whirls': [
    CupertinoIcons.wind,
    CupertinoColors.systemGrey,
  ],
  'fog': [
    CupertinoIcons.cloud_fog_fill,
    CupertinoColors.systemGrey,
  ],
  'sand': [
    CupertinoIcons.wind,
    CupertinoColors.systemGrey,
  ],
  'dust': [
    CupertinoIcons.sun_dust_fill,
    CupertinoColors.systemGrey,
  ],
  'volcanic ash': [
    Icons.grain,
    CupertinoColors.systemGrey,
  ],
  'squalls': [
    CupertinoIcons.wind,
    CupertinoColors.systemGrey,
  ],
  'tornado': [
    CupertinoIcons.tornado,
    CupertinoColors.systemGrey,
  ],
};

const iconSize = 40.0;
const defaultIcon = CupertinoIcons.question_circle;
const defaultColor = CupertinoColors.systemGrey;

Icon getWeatherIcon(String condition) {
  final iconData =
      weatherIcons[condition.toLowerCase()] ?? [defaultIcon, defaultColor];
  return Icon(iconData[0], size: iconSize, color: iconData[1]);
}
