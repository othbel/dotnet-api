FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /app

COPY . .

RUN dotnet restore DotNet.Docker.csproj

RUN dotnet publish -o build -c Release DotNet.Docker.csproj

FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /app

COPY --from=build /app/build .

CMD [ "dotnet", "DotNet.Docker.dll" ]