﻿FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["AspNetCore/AspNetCore.csproj", "AspNetCore/"]
RUN dotnet restore "AspNetCore/AspNetCore.csproj"
COPY . .
WORKDIR "/src/AspNetCore"
RUN dotnet build "AspNetCore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AspNetCore.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AspNetCore.dll"]
