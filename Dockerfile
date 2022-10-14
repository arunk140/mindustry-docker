FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
RUN mkdir /opt/app
RUN apt-get update && apt-get install -y jq curl
RUN curl -s https://api.github.com/repos/Anuken/Mindustry/releases | jq -r '.[0].assets[1].browser_download_url' | xargs curl -L -o /opt/app/server-release.jar
EXPOSE 6567
CMD ["java", "-jar", "/opt/app/server-release.jar", "host"]
