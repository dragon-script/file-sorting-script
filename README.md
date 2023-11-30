# File Sorting Script

This Bash script is designed to sort files from a source directory into subdirectories based on their types (image, document, video, audio, etc.). Additionally, the script handles potential name collisions by renaming files with a numeric suffix.

## Usage

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/dragon-script/file-sorting-script.git
    ```

2. **Navigate to the Script:**

    ```bash
    cd file-sorting-script
    ```

3. **Make the Script Executable:**

    ```bash
    chmod +x sort_files.sh
    ```

4. **Run the Script:**

    ```bash
    ./sort_files.sh <source_directory> <destination_directory>
    ```

- **<source_directory>**: The directory containing the files you want to sort.
- **<destination_directory>**: The directory where the sorted files will be placed.

## Script Structure
# Functions
The script is organized into functions for improved modularity and readability:

- **log()**
This function logs messages with timestamps to a log file (sort_files.log).

- **create_directories()**
Creates subdirectories in the destination directory for different file types.

- **handle_collision()**
Handles name collisions by renaming files with numeric suffixes to avoid overwriting existing files.

- **categorize_files()**
Categorizes and moves files from the source directory to the appropriate subdirectories based on their types.

- It also utilizes **handle_collision()** to address name collisions.

## Error Handling
The script includes error handling to check for the correct number of command-line arguments. If the user fails to provide both source and destination directories, the script displays an error message and exits.

## Logging
The script logs various activities, such as directory creation, file movements, and name collision handling, to a log file `sort_files.log`. This log file provides a detailed record of the script's execution.
