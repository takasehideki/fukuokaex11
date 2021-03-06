# fukuokaex11

Elixir/Phoenix projects for [fukuoka.ex#11](https://fukuokaex.connpass.com/event/87241/)

## Project list

+ 1: examples_on_grovepi (copied from [adkron/grovepi](https://github.com/adkron/grovepi))
  - [alarm](./examples_on_grovepi/alarm)
  - [demo_rgblcd](./examples_on_grovepi/demo_rgblcd)
  - [home_weather_display](./examples_on_grovepi/home_weather_display)
  - [led_fade](./examples_on_grovepi/led_fade)
+ 2: [dht_sensor](./dht_sensor)
  - Print temparature and humidity values to IO when value was change on 3s 
    - DHT for Port D7
  - Run by `$ MIX_ENV=prod iex -S mix`
+ 3: [home_weather_display_host](./home_weather_display_host)
  - Display temparature and humidity values to LCD when value was change on 3s 
    - DHT for Port D7
    - LCD for I2C-1
  - Run by `$ MIX_ENV=prod iex -S mix`
+ 4: [home_weather_csv](./home_weather_csv)
  - Write temparature and humidity values to CSV (`dhtdata.csv`) when value was change on 3s 
    - DHT for Port D7
    - LCD for I2C-1
  - Run by `$ MIX_ENV=prod iex -S mix`
+ 5: [phx_chartjs](./phx_chartjs)
  - Chart.js example on phoenix
  - Run by `$ mix phx.server`
+ 6: [phx_csvjs](./phx_csvjs)
  - Display DHT value by Chart.js
  - Run by `$ MIX_ENV=dev mix phx.server`
    - Also run `home_weather_csv/` on another terminal.
+ 7: [home_weather_phx](./home_weather_phx)
  - **Display temparature/humidity and ultrasonic distance values on Phoenix Page!!**
    - [DHT](http://wiki.seeedstudio.com/Grove-TemperatureAndHumidity_Sensor/) for Port D7
    - [Ultrasonic Ranger](http://wiki.seeedstudio.com/Grove-Ultrasonic_Ranger/) for Port D4
    - [LCD](http://wiki.seeedstudio.com/Grove-LCD_RGB_Backlight/) for I2C-1
  - Set today's date to L150 of `lib/home_weather_phx_web/templates/page/index.html.eex`
  - Run by `$ MIX_ENV=dev mix phx.server`
  - Then, access to `http://<IP>:4000/` to show the DHT & distance value



## References

- GitHub repository
  - [adkron/grovepi](https://github.com/adkron/grovepi)
- Qiita article (in Japanese)
  - T.B.A

