### Configuring System Clock 
```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```
### Installing The Silver Searcher
```
winget install "The Silver Searcher"
```