# Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source
COPY ./ .
RUN dotnet publish ./BlazorIssue/BlazorIssue.csproj -c Release -o /output

# Run
FROM mcr.microsoft.com/dotnet/aspnet:9.0
COPY --from=build /output /app
ENTRYPOINT ["dotnet", "/app/BlazorIssue.dll"]