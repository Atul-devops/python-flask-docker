FROM python:3.6
LABEL maintainer="demo-app"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8070
ENTRYPOINT ["python"]
CMD ["app/app.py"]
