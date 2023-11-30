# File Sorting Script

This documentation provides information on using the Banana script for sorting files.

## Usage

To use the Banana script, follow these steps:

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/dragon-script/File-Sorting-Script.git
    ```

2. **Navigate to the Script:**

    ```bash
    cd File-Sorting-Script
    ```

3. **Make the Script Executable:**

    ```bash
    chmod +x sort_files.sh
    ```

4. **Run the Script:**

    ```bash
    ./sort_files.sh /path/to/source /path/to/destination
    ```

Make sure to replace "/path/to/source" and "/path/to/destination" with your actual source and destination directories.

## Script Features

### Modularity

The script is modularized with functions for better organization and maintainability.

### Logging

The script logs activities to a file named `sort_files.log`. You can review this file for details on each step of the sorting process.

### Error Handling

The script includes error handling to address potential issues, such as name collisions. In case of a collision, the script will rename the file to prevent overwriting.

## Example

Below is an example of a script execution:

```bash
./sort_files.sh /path/to/source /path/to/destination
```
