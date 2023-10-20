FROM python:3.9-slim
EXPOSE 8080
RUN pip3 install streamlit

WORKDIR E:/Movie_Recommendation_System
COPY . ./




ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]