defmodule HomeWeatherPhx do
  @moduledoc false
  use GenServer
  use Timex
  require Logger

  defstruct [:dht]

  alias GrovePi.{RGBLCD, DHT}

  @us_pin 4 # Use port 4 for Ultrasonic

  def start_link(pin) do
    GenServer.start_link(__MODULE__, pin)
  end

  def init(dht_pin) do
    state = %HomeWeatherPhx{dht: dht_pin}

    {:ok, _pid} = GrovePi.Ultrasonic.start_link(@us_pin)

    RGBLCD.initialize()
    RGBLCD.set_text("Ready!")

    # Create CSV file
    File.write "priv/static/dhtdata.csv", ""

    DHT.subscribe(dht_pin, :changed)
    {:ok, state}
  end

  def handle_info({_pin, :changed, %{temp: temp, humidity: humidity}}, state) do
    # Measure distance
    distance = GrovePi.Ultrasonic.read_distance(@us_pin)
    distance = if distance >= 200, do: 0, else: distance
    
    # Get date
    date = Timex.now("Asia/Tokyo")
      |> Timex.format!( "%Y-%m-%d %H:%M:%S", :strftime )

    # Write data to CSV
    File.write "priv/static/dhtdata.csv", "#{date},#{temp},#{humidity},#{distance}\n", [:append]

    temp = format_temp(temp)
    humidity = format_humidity(humidity)
    distance = format_distance(distance)

    flash_rgb()

    RGBLCD.set_text(temp)
    RGBLCD.set_cursor(1, 0)
    RGBLCD.write_text(humidity)
    Logger.info temp <> " " <> humidity <> "" <> distance

    {:noreply, state}
  end

  def handle_info(_message, state) do
    {:noreply, state}
  end

  defp flash_rgb() do
    RGBLCD.set_rgb(255, 0, 0)
    Process.sleep(1000)
    RGBLCD.set_color_white()
  end

  defp format_temp(temp) do
    "Temp: #{Float.to_string(temp)} C"
  end

  defp format_humidity(humidity) do
    "Humidity: #{Float.to_string(humidity)}%"
  end

  defp format_distance(distance) do
    "distance: #{distance}cm"
  end
end
