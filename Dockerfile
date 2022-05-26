FROM microsoft/aspnetcore-build:4.4.1
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM microsoft/aspnetcore:4.4.1
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]
