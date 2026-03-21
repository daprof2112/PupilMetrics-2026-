@echo off
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" dinolite_bridge.csproj /p:Configuration=Release /p:Platform=x86 /t:Rebuild
