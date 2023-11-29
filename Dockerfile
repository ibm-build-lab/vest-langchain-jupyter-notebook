FROM python:3.11 as build

WORKDIR /build/

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY ./requirements.txt /build/requirements.txt
RUN python3 -m pip install --no-cache-dir -r requirements.txt

FROM jupyter/minimal-notebook
WORKDIR /home/jovyan/work/
COPY --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Move notebooks to working dir; match hub mount location
COPY langchain-intro.ipynb /home/jovyan/work/langchain-intro.ipynb
COPY langchain-summarization.ipynb /home/jovyan/work/langchain-summarization.ipynb
COPY what-is-generative-ai.pdf /home/jovyan/work/what-is-generative-ai.pdf
