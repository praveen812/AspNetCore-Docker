FROM microsoft/aspnetcore-build:6.0.5 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM microsoft/aspnetcore:6.0.5
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]
