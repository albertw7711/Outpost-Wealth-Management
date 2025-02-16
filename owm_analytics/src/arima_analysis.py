import pandas as pd
from statsmodels.tsa.arima.model import ARIMA
import matplotlib.pyplot as plt
from data_loader import load_data

def run_arima_forecast(data: pd.DataFrame, order=(1, 1, 1), forecast_steps=10):
    if 'date' in data.columns:
        data['date'] = pd.to_datetime(data['date'])
        data.set_index('date', inplace=True)
    if 'value' not in data.columns:
        raise ValueError("Data must contain a 'value' column for forecasting.")
    model = ARIMA(data['value'], order=order)
    model_fit = model.fit()
    forecast = model_fit.forecast(steps=forecast_steps)
    return forecast, model_fit

if __name__ == '__main__':
    sample_file = "../data/raw/sample_data.csv"
    data = load_data(sample_file)
    if data.empty:
        print("No data loaded. Please verify the file path and contents.")
    else:
        forecast, model_fit = run_arima_forecast(data, order=(1, 1, 1), forecast_steps=10)
        print("Forecasted Values:")
        print(forecast)
        data['value'].plot(label="Historical Data")
        forecast.plot(label="Forecast", style="--")
        plt.legend()
        plt.title("ARIMA Forecast")
        plt.show()
