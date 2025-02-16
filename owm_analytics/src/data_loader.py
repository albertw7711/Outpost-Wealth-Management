import pandas as pd

def load_data(file_path: str) -> pd.DataFrame:
    try:
        df = pd.read_csv(file_path)
        print(f"Data loaded successfully from {file_path}")
        return df
    except Exception as e:
        print(f"Error loading data from {file_path}: {e}")
        return pd.DataFrame()

if __name__ == '__main__':
    sample_file = "../data/raw/sample_data.csv"
    df = load_data(sample_file)
    print(df.head())
