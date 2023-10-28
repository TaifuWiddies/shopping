# pull official base image
FROM python:3.8.0-alpine
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade pip

WORKDIR /app/
COPY ./backend/src /app
COPY ./backend/requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8000
# NO longer want to generate the FastAPI I want to generate a CSV.
# CMD ["python3","main.py"]
CMD ["python3", "render_csv.py"]