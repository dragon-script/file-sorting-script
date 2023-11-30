#!/bin/bash

# Function to log messages
log() {
    local log_file="sort_files.log"
    echo "$(date '+%Y-%m-%d %H:%M:%S') $1: $2" >> "$log_file"
}

# Function to create directories
create_directories() {
    mkdir -p "$1/images" "$1/documents" "$1/videos" "$1/audio" "$1/others"
    log "Created directories", "$1"
}

# Function to handle name collisions
handle_collision() {
    local source="$1"
    local destination="$2"
    local file="$3"
    local count=1

    while [ -e "$destination/$file" ]; do
        # If file with the same name already exists in the destination, rename it
        file="${file%.*}_$count.${file##*.}"
        ((count++))
    done

    log "Renamed file due to collision", "$file in $source to $destination/$file"
    mv "$source/$3" "$destination/$file"
}

# Function to categorize and move files
categorize_files() {
    local src="$1"
    local dest="$2"
    
    for file in "$src"/*; do
        local filename=$(basename "$file")
        local extension="${filename##*.}"

        case "$extension" in
            jpg|jpeg|png|gif)
                if [ -e "$dest/images/$filename" ]; then
                    handle_collision "$src" "$dest/images" "$filename"
                else
                    mv "$file" "$dest/images/"
                    log "Moved file", "$file to $dest/images/"
                fi
                ;;
            pdf|doc|docx|txt)
                if [ -e "$dest/documents/$filename" ]; then
                    handle_collision "$src" "$dest/documents" "$filename"
                else
                    mv "$file" "$dest/documents/"
                    log "Moved file", "$file to $dest/documents/"
                fi
                ;;
            mp4|avi|mkv|mov)
                if [ -e "$dest/videos/$filename" ]; then
                    handle_collision "$src" "$dest/videos" "$filename"
                else
                    mv "$file" "$dest/videos/"
                    log "Moved file", "$file to $dest/videos/"
                fi
                ;;
            mp3|wav|flac)
                if [ -e "$dest/audio/$filename" ]; then
                    handle_collision "$src" "$dest/audio" "$filename"
                else
                    mv "$file" "$dest/audio/"
                    log "Moved file", "$file to $dest/audio/"
                fi
                ;;
            *)
                if [ -e "$dest/others/$filename" ]; then
                    handle_collision "$src" "$dest/others" "$filename"
                else
                    mv "$file" "$dest/others/"
                    log "Moved file", "$file to $dest/others/"
                fi
                ;;
        esac
    done

    log "Categorized files and handled name collisions in", "$src and moved to $dest"
}

# Check if both source and destination directories are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

src_dir="$1"
dest_dir="$2"

# Log the start of the script
log "Sorting started for source", "$src_dir, destination: $dest_dir"

# Create directories
create_directories "$dest_dir"

# Categorize and move files
categorize_files "$src_dir" "$dest_dir"

# Log the completion of the script
log "Sorting complete for source", "$src_dir, destination: $dest_dir"

echo "Sorting complete. Check sort_files.log for details."
