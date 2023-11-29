FROM jupyter/minimal-notebook

USER root

RUN apt-get update && apt-get -y install build-essential

COPY requirements.txt requirements.txt

RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Move notebooks to working dir; match hub mount location
COPY langchain-intro.ipynb /home/jovyan/work/langchain-intro.ipynb
COPY langchain-summarization.ipynb /home/jovyan/work/langchain-summarization.ipynb
COPY what-is-generative-ai.pdf /home/jovyan/work/what-is-generative-ai.pdf

RUN rm requirements.txt
