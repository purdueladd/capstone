import requests
import datetime

API_KEY = 'XXXXXXXX'  # replace 'YOUR_API_KEY' with your actual API key
BASE_URL = "https://pro.openweathermap.org/data/2.5/onecall"
LAT, LON = 29.749907, -95.358421  # replace with latitude and longitude of your desired city, e.g., London, UK

def get_forecast_data(api_key, lat, lon):
    params = {
        'lat': lat,
        'lon': lon,
        'exclude': 'current,minutely,hourly,alerts',
        'units': 'imperial',  # 'imperial' for Fahrenheit
        'appid': api_key
    }

    response = requests.get(BASE_URL, params=params)

    if response.status_code != 200:
        print(f"Error {response.status_code}: {response.text}")
        return

    return response.json().get('daily', [])[:10]  # get data for the next 10 days

def extract_desired_data(forecast_data):
    return {
        'Date': datetime.datetime.fromtimestamp(forecast_data['dt']).strftime('%Y-%m-%d'),
        'Day': datetime.datetime.fromtimestamp(forecast_data['dt']).strftime('%A'),
        'Temp_max': forecast_data['temp']['max'],
        'Hum_max': forecast_data['humidity'],
        'Wind_avg': forecast_data['wind_speed'],
        'Precipit': forecast_data.get('rain', 0)  # if rain is not present, default to 0
    }

def main():
    forecast_data = get_forecast_data(API_KEY, LAT, LON)
    if forecast_data:
        for day_data in forecast_data:
            extracted_data = extract_desired_data(day_data)
            print('-' * 50)  # just to separate data for different days
            for key, value in extracted_data.items():
                print(f"{key}: {value}")

if __name__ == "__main__":
    main()
