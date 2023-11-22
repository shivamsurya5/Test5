# Use the official Microsoft IIS image as a base image
FROM mcr.microsoft.com/windows/servercore/iis

# Create a directory to store your web application files
WORKDIR /inetpub/wwwroot

# Copy your application files into the container
COPY . .

# Expose port 80 for HTTP traffic
EXPOSE 80

# Set up the IIS website
RUN powershell -NoProfile -Command \
    Import-Module IISAdministration; \
    New-IISSite -Name "DefaultWebSite" -PhysicalPath C:\inetpub\wwwroot -BindingInformation "*:80:"

# Start the IIS service
CMD ["C:\\ServiceMonitor.exe", "w3svc"]

