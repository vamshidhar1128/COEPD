# ------------ STAGE 1: Build the application ------------
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy project files and restore
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the code
COPY . ./
RUN dotnet publish -c Release -o /app/out

# ------------ STAGE 2: Runtime image ------------
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app

# Copy from build image
COPY --from=build /app/out ./

EXPOSE 5002
ENTRYPOINT ["dotnet", "COEPDNew.dll"]
