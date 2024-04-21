#!/bin/bash

# Activate the base conda environment
source ~/mambaforge/etc/profile.d/conda.sh
conda activate base

# Define folder path and other parameters
FOLDER_PATH="Python Scripts"
ANALYSIS_FOLDER="Analysis"
NUM_RUNS=10
CSV_FILE="$ANALYSIS_FOLDER/run_times.csv"

# Remove existing CSV file if present
rm -f "$CSV_FILE"

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

# Function to run multiple Python scripts concurrently
run_multicore() {
    python_files=("$@")

    # Run each Python script in a separate process
    for file in "${python_files[@]}"; do
        run_python_script "$file" &
    done

    # Wait for all processes to finish
    wait
}

# Loop through .py files in the folder and run them
cd "$FOLDER_PATH" || exit
python_files=()
for file in *.py; do
    python_files+=("$file")
done

# Run Python scripts concurrently
run_multicore "${python_files[@]}"

echo "Execution complete. Results written to $CSV_FILE"

# Deactivate the conda environment
conda deactivate