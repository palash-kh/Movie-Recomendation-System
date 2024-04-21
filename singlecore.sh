#!/bin/bash

# Activate the base conda environment
source ~/mambaforge/etc/profile.d/conda.sh
conda activate base

# Define folder path and other parameters
PROJECT_FOLDER="/home/rakshit/Desktop/Movie-Recomendation-System"
FOLDER_PATH="$PROJECT_FOLDER/Python Scripts"
ANALYSIS_FOLDER="$PROJECT_FOLDER/Analysis"
NUM_RUNS=10
CSV_FILE="$ANALYSIS_FOLDER/run_time.csv"

# Create the Analysis folder if it doesn't exist
mkdir -p "$ANALYSIS_FOLDER"

# Remove existing CSV file if present
if [ -f "$CSV_FILE" ]; then
    rm "$CSV_FILE"
fi

# Function to run a Python script and record its run time
run_python_script() {
    file="$1"
    for ((i=1; i<=$NUM_RUNS; i++)); do
        echo "Running $file - Attempt $i"
        start_time=$(date +%s.%N)
        python "$file"
        end_time=$(date +%s.%N)
        run_time=$(echo "$end_time - $start_time" | bc)
        echo "$file,$run_time" >> "$CSV_FILE"
    done
}

# Loop through .py files in the folder and run them sequentially
cd "$FOLDER_PATH" || exit
python_files=()
for file in *.py; do
    run_python_script "$file"
done

echo "Execution complete. Results written to $CSV_FILE"

# Deactivate the conda environment
conda deactivate
