import os

def rename_files(directory):
    # Iterate over all files and directories in the current directory
    for root, dirs, files in os.walk(directory):
        for filename in files:
            # Check if the file ends with "8.x" and has a .py extension
            if filename.endswith("7.x.php"):
                # Construct the old and new file paths
                old_filepath = os.path.join(root, filename)
                new_filename = filename.replace("7.x", "8.x")
                new_filepath = os.path.join(root, new_filename)

                # Rename the file
                os.rename(old_filepath, new_filepath)
                print(f"Renamed {old_filepath} to {new_filepath}")

        # Recursively call rename_files for subdirectories
        for subdir in dirs:
            rename_files(os.path.join(root, subdir))

if __name__ == "__main__":
    # Start renaming from the current directory
    rename_files(os.getcwd())
