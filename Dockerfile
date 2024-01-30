FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make sure the shell is bash:
SHELL ["/bin/bash", "-c"]

# Activate the Conda environment:
RUN echo "source activate myenv" >> ~/.bashrc
ENV PATH /opt/conda/envs/myenv/bin:$PATH

# Demonstrate the environment is activated:
RUN echo "Make sure flask is installed:"
# RUN python -c "import flask"

# Copy the Python script:
COPY run.py .

# Set the default command to run your Python script:
CMD ["python", "run.py"]
