
# Define the root directory
$rootPath = "C:\Outpost_Wealth_Management"

# Create the root directory if it doesn't exist
if (-not (Test-Path $rootPath)) {
    New-Item -ItemType Directory -Path $rootPath | Out-Null
    Write-Output "Created root directory: $rootPath"
}
else {
    Write-Output "Root directory already exists: $rootPath"
}

# Define the folders to create
$folders = @("backend", "frontend", "analytics", "docs")

# Create each folder under the root directory
foreach ($folder in $folders) {
    $folderPath = Join-Path $rootPath $folder
    if (-not (Test-Path $folderPath)) {
        New-Item -ItemType Directory -Path $folderPath | Out-Null
        Write-Output "Created folder: $folderPath"
    }
    else {
        Write-Output "Folder already exists: $folderPath"
    }
}

# Define the root-level files to create
$files = @("docker-compose.yml", ".gitignore", "README.md")

# Create each file under the root directory
foreach ($file in $files) {
    $filePath = Join-Path $rootPath $file
    if (-not (Test-Path $filePath)) {
        New-Item -ItemType File -Path $filePath | Out-Null
        Write-Output "Created file: $filePath"
    }
    else {
        Write-Output "File already exists: $filePath"
    }
}
