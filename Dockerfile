FROM jupyter/minimal-notebook

USER root

RUN apt-get update && apt-get -y install build-essential

COPY requirements.txt requirements.txt

# add or remove --no-cache-dir
RUN python3 -m pip install -r requirements.txt

# From L4 official labs:
COPY l4-langchain-integration.ipynb /home/jovyan/work/l4-langchain-integration.ipynb
COPY l4-langchain-memory.ipynb /home/jovyan/work/l4-langchain-memory.ipynb
COPY l4-langchain-simple-rag.ipynb /home/jovyan/work/l4-langchain-simple-rag.ipynb

# Move notebooks to working dir; match hub mount location
COPY langchain-intro.ipynb /home/jovyan/work/langchain-intro.ipynb
COPY langchain-summarization.ipynb /home/jovyan/work/langchain-summarization.ipynb
COPY what-is-generative-ai.pdf /home/jovyan/work/what-is-generative-ai.pdf

RUN rm requirements.txt