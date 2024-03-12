FROM python:3.10-slim

RUN apt-get update && apt-get install gcc g++ git make -y && apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH

WORKDIR $HOME/app

COPY --chown=user . $HOME/app
EXPOSE 7860
RUN pip install langflow==0.6.10 -U --user
RUN pip list
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
