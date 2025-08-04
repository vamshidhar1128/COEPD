# ----------------------
# 1️⃣ Build Stage
# ----------------------
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set working directory for the build context
WORKDIR /src

# Copy only the project file and restore dependencies
COPY COEPD-DOTNET/*.csproj ./COEPD-DOTNET/
WORKDIR /src/COEPD-DOTNET
RUN dotnet restore

# Copy the remaining source code
COPY COEPD-DOTNET/. ./  # Copy contents of the COEPD-DOTNET folder

# Build and publish the application to /app
RUN dotnet publish -c Release -o /app

# ----------------------
# 2️⃣ Runtime Stage
# ----------------------
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Set working directory in runtime container
WORKDIR /app

# Copy the published output from the build stage
COPY --from=build /app .

# Configure environment and port
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV ASPNETCORE_URLS=http://0.0.0.0:5002

EXPOSE 5002

# Define entry point
ENTRYPOINT ["dotnet", "COEPD-DOTNET.dll"]
