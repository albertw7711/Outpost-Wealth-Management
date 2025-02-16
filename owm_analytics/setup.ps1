# Define the base path for the analytics project
$basePath = "C:\Outpost_Wealth_Management\owm_analytics"

# Create the base directory if it doesn't exist
if (-not (Test-Path $basePath)) {
    New-Item -ItemType Directory -Path $basePath | Out-Null
    Write-Output "Created root directory: $basePath"
} else {
    Write-Output "Root directory already exists: $basePath"
}

# List of directories to create relative to the base path
$directories = @(
    "data\raw",                   # Raw data files
    "data\processed",             # Processed data files
    "notebooks",                  # Jupyter notebooks for exploratory analysis
    "src",                        # Python source code root
    "src\models",                 # Model definitions (e.g., ARIMA)
    "src\utils"                   # Utility functions (e.g., visualization)
)

# Create each directory if it does not exist
foreach ($dir in $directories) {
    $fullPath = Join-Path $basePath $dir
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Output "Created directory: $fullPath"
    } else {
        Write-Output "Directory already exists: $fullPath"
    }
}

# List of files to create (with their relative paths)
$files = @(
    "src\__init__.py",             # Makes 'src' a package
    "src\data_loader.py",          # Data loading and cleaning functions
    "src\arima_analysis.py",       # Main script for ARIMA analysis
    "src\models\arima_model.py",   # ARIMA forecasting model implementation
    "src\utils\visualization.py",  # Data visualization functions
    "requirements.txt",            # Python dependencies list
    "Dockerfile",                  # Dockerfile for containerizing the analytics component
    "README.md"                    # Documentation for the analytics component
)

# Create each file if it does not exist
foreach ($file in $files) {
    $fullPath = Join-Path $basePath $file
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType File -Path $fullPath | Out-Null
        Write-Output "Created file: $fullPath"
    } else {
        Write-Output "File already exists: $fullPath"
    }
}
