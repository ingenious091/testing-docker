import subprocess

def get_spleeter_version():
    try:
        # Run the command 'spleeter --version' and capture its output
        output = subprocess.check_output(['spleeter', '--version'], stderr=subprocess.STDOUT, text=True)
        # Print or return the output
        print(output)
    except subprocess.CalledProcessError as e:
        # If an error occurs (e.g., command not found), handle it here
        print("Error:", e)

# Call the function to get the version of Spleeter
get_spleeter_version()
