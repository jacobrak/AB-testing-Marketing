# Use official Python 3.8 image from Docker Hub
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies for PyMC3
RUN apt-get update && apt-get install -y \
    build-essential \
    libatlas-base-dev \
    gfortran \
    liblapack-dev \
    libblas-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libffi-dev \
    python3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install necessary Python packages
RUN pip install --upgrade pip && pip install pymc jupyter
RUN pip install --upgrade pip && pip install pymc3 jupyter seaborn

# Expose Jupyter Notebook port
EXPOSE 8888

# Default command: Start Jupyter Notebook
CMD ["jupyter", "notebook", "--NotebookApp.token=''", "--NotebookApp.password=''", "--NotebookApp.allow_origin='*'", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]


