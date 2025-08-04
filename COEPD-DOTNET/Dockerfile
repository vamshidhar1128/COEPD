# ----------------------
# 1️⃣ Build Stage
# ----------------------
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source

# Copy only the .csproj file
COPY COEPD-DOTNET/*.csproj COEPD-DOTNET/

# Restore dependencies
WORKDIR /source/COEPD-DOTNET
RUN dotnet restore

# Copy the full source code into the container
COPY . .

# Publish the application
RUN dotnet publish -c Release -o /app

# ----------------------
# 2️⃣ Runtime Stage
# ----------------------
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app

# ✅ Copy from build stage
COPY --from=build /app .

EXPOSE 5002
ENV DOTNET_RUNNING_IN_CONTAINER=true \
    ASPNETCORE_URLS=http://0.0.0.0:5002

ENTRYPOINT ["dotnet", "COEPD-DOTNET.dll"]
