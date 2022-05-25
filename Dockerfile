FROM microsoft/aspnetcore-build:2.1 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM microsoft/aspnetcore:2.1
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]
