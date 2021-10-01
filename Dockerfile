FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim as build

WORKDIR usr/src/app

COPY . .
RUN dotnet build DockerTest.csproj --configuration=Release -o /app/build
RUN dotnet publish DockerTest.csproj --configuration=Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0-buster-slim as base
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "DockerTest.dll"]

