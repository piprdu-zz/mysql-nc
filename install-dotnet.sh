wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get -y install apt-transport-https
sudo apt-get -y install dotnet-runtime-3.1
sudo apt-get -y install aspnetcore-runtime-3.1
dotnet restore test-mysql-nc/test-mysql-nc.csproj
dotnet test test-mysql-nc/test-mysql-nc.csproj