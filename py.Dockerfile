FROM demisto/python3

WORKDIR /app

COPY ./py .

CMD ["python3", "/app/main.py"]