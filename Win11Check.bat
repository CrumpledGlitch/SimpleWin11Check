@REM win11check
@echo off
title Windows 11 Compatibility Check [MR] >con


@REM echo __/\\\______________/\\\__________________________/\\\______/\\\__________________/\\\\\\\\\__/\\\_______________________________________________________________________________________/\\\\____________/\\\\____/\\\\\\\\\_____        
@REM echo _\/\\\_____________\/\\\______________________/\\\\\\\__/\\\\\\\_______________/\\\////////__\/\\\_______________________________________/\\\___________________________________________\/\\\\\\________/\\\\\\__/\\\///////\\\___       
@REM echo  _\/\\\_____________\/\\\__/\\\_______________\/////\\\_\/////\\\_____________/\\\/___________\/\\\______________________________________\/\\\___________________________________________\/\\\//\\\____/\\\//\\\_\/\\\_____\/\\\___      
@REM echo   _\//\\\____/\\\____/\\\__\///___/\\/\\\\\\_______\/\\\_____\/\\\____________/\\\_____________\/\\\_____________/\\\\\\\\______/\\\\\\\\_\/\\\\\\\\_______________/\\\\\\\\\\\___________\/\\\\///\\\/\\\/_\/\\\_\/\\\\\\\\\\\/____     
@REM echo    __\//\\\__/\\\\\__/\\\____/\\\_\/\\\////\\\______\/\\\_____\/\\\___________\/\\\_____________\/\\\\\\\\\\____/\\\/////\\\___/\\\//////__\/\\\////\\\____________\///////////____________\/\\\__\///\\\/___\/\\\_\/\\\//////\\\____    
@REM echo     ___\//\\\/\\\/\\\/\\\____\/\\\_\/\\\__\//\\\_____\/\\\_____\/\\\___________\//\\\____________\/\\\/////\\\__/\\\\\\\\\\\___/\\\_________\/\\\\\\\\/_____________________________________\/\\\____\///_____\/\\\_\/\\\____\//\\\___   
@REM echo      ____\//\\\\\\//\\\\\_____\/\\\_\/\\\___\/\\\_____\/\\\_____\/\\\____________\///\\\__________\/\\\___\/\\\_\//\\///////___\//\\\________\/\\\///\\\_____________________________________\/\\\_____________\/\\\_\/\\\_____\//\\\__  
@REM echo       _____\//\\\__\//\\\______\/\\\_\/\\\___\/\\\_____\/\\\_____\/\\\______________\////\\\\\\\\\_\/\\\___\/\\\__\//\\\\\\\\\\__\///\\\\\\\\_\/\\\_\///\\\___________________________________\/\\\_____________\/\\\_\/\\\______\//\\\_ 
@REM echo        ______\///____\///_______\///__\///____\///______\///______\///__________________\/////////__\///____\///____\//////////_____\////////__\///____\///____________________________________\///______________\///__\///________\///__


echo Yb        dP 88 88b 88       .d   .d      dP""b8 88  88 888888  dP""b8 88  dP                  8b    d8 88""Yb 
echo Yb  db  dP  88 88Yb88     .d88 .d88     dP   `" 88  88 88__   dP   `" 88odP      ________     88b  d88 88__dP 
echo  YbdPYbdP   88 88 Y88       88   88     Yb      888888 88""   Yb      88"Yb      """"""""     88YbdP88 88"Yb  
echo   YP  YP    88 88  Y8       88   88      YboodP 88  88 888888  YboodP 88  Yb                  88 YY 88 88  Yb 



echo.
echo [95mThis tool will check if the PC can run windows 11, if it cant, i'll tell you why.[0m
echo [91mOnly use this tool if you know what you're doing ... [0m
echo.



goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [92mSuccess: Administrative permissions confirmed.[0m
        goto Core1

    ) else (
        echo [91mFailure: Current permissions inadequate, please run as admin or ask M for support.[0m
        pause >nul
        exit 1;
    )
    

:Core1
echo. >con
echo ------
echo. >con
echo Checking CPU Compatibility... 
powershell Get-WmiObject -Class Win32_Processor -ComputerName. ^| Select -ExpandProperty Name >%temp%\CPUC.log
set /p "CPUn=" <%temp%\CPUC.log
type %temp%\CPUC.log | findstr /c:"Intel" >nul 2>&1 && set "CPU=Intel"
type %temp%\CPUC.log | findstr /c:"AMD" >nul 2>&1 && set "CPU=AMD"
type %temp%\CPUC.log | findstr /c:"Qualcomm" >nul 2>&1 && set "CPU=Qualcomm"


echo Your PC has an %CPU% CPU [%CPUn%]. >con
echo .
echo [4mPlease note this next step can take a few moments ...[0m

@REM Below is a list that decides if CPU is compatible with the installation

if "%CPU%"=="Intel" (
type %temp%\CPUC.log | findstr /c:"Atom(R) x6200FE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6211E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6212RE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6413E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6414RE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6425E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6425RE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Atom(R) x6427FE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4900 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4900T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4920 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4930 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4930E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4930T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4932E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G4950 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J4005 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J4105 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J4115 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4000 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4100 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 3867U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 4205U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 4305U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 4305UE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J4025 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J4125 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4020 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4120 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 5205U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 5305U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5900 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5900E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5900T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5900TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5905 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5905T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5920 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) G5925 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J6412 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) J6413 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N6210 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N6211 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N4505 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N5100 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) N5105 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 6305 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Celeron(R) 6305E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-7640X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-7740X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-7800X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-7820HQ " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-7820X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-7900X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-7920X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-7940X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-7960X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-7980XE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10210Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10310Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8200Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8210Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8310Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10510Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8500Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) m3-8100Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8100 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8100B " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8100H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8100T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8109U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8140U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8300 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8300T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8350K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8257U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8259U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8260U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8269U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8279U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8300H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8400B " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8400H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8500B " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8600K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8086K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8557U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8559U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8569U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8700 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8700B " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8700K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8700T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8750H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8809G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8850H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8130U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8250U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8350U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8550U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8650U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8145U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-8145UE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8265U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8365U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-8365UE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8565U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8665U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-8665UE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100HL " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9100TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9300 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9300T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9320 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9350K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-9350KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9300H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9300HF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9400F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9400H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9500E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9500F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9500TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9600K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9600KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-9600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9700TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9750H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9750HF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9800X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9850H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9850HE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-9850HL " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-8950HK " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9880H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900KS " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9900X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9920X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9940X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9960X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-9980HK " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10110Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10920X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10940X " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10980XE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10100TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10105 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10105F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10105T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10110U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10300 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10300T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10305 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10305T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10320 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-10325 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10200H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10210U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10300H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10310U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10400F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10400H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10500E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10500H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10500TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10600K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10600KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-10600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10510U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10610U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10700TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10710U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10750H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10810U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10850H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10870H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-10875H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10850K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10885H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10900TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-10980HK " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1000G1 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1000G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1005G1 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1030G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1030G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1035G1 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1035G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1035G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1038NG7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1060G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1065G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1068NG7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-L13G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-L16G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11400F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11600K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11600KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11700 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11700F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11700K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11700KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11700T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-11900 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-11900F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-11900K " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-11900KF " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i9-11900T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1110G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1115G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1115G4E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1115GRE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1120G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i3-1125G4 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-11300H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1130G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1135G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1135G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1140G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1145G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1145G7E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i5-1145GRE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11370H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-11375H " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1160G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1165G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1165G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1180G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1185G7 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1185G7E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Core(TM) i7-1185GRE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 4425Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 6500Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5420 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5420T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G5620 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold 4425Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold 6500Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5420 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5420T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5600T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G5620 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver J5005 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver N5000 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 4417U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 5405U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold 4417U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold 5405U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver J5040 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver N5030 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold 6405U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6400E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6400TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6405 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6405T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6505 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6505T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Gold G6605 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 6405U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6400 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6400E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6400T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6400TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6405 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6405T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6500 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6500T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6505 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6505T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6600 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU G6605 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) 6805 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) J6426 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) N6415 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver N6000 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) Silver N6005 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Pentium(R) CPU 7505 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Bronze 3104 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Bronze 3106 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5115 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5118 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5119T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5120 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5120T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5122 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6126 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6126F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6126T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6128 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6130 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6130F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6130T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6132 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6134 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6136 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6138 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6138F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6138P " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6138T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6140 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6142 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6142F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6144 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6146 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6148 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6148F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6150 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6152 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6154 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8153 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8156 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8158 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8160 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8160F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8160T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8164 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8168 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8170 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8176 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8176F " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8180 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4108 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4109T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4110 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4112 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4114 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4114T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4116 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4116T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2124 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2124G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2126G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2134 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2136 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2144G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2146G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2174G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2176G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2176M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2186G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2186M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2224 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2224G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2226G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2226GE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2234 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2236 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2244G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2246G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2254ME " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2254ML " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2274G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2276G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2276M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2276ME " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2276ML " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2278G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2278GE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2278GEL " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2286G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2286M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) E-2288G " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Bronze 3204 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Bronze 3206R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5215 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5215L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5217 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5218B " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5218N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5218R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5218T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5220 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5220R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5220S " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5220T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5222 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6208U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6209U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6210U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6212U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6222V " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6226 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6226R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6230 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6230N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6230R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6230T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6238 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6238L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6238T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6240 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6240L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6240R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6240Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6242 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6242R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6244 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6246R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6248 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6248R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6250 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6250L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6252 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6252N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6254 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6256 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6258R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6262V " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5218 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6238R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6246 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6234 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8253 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8256 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8260 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8260L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8260Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8268 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8270 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8276 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8276L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8280 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8280L " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 9221 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 9222 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 9242 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 9282 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4208 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4209T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4210 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4210R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4210T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4214 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4214R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4214Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4215 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4215R " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4216 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2223 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2225 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2235 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2245 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2255 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2265 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2275 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2295 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3223 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3225 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3235 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3245 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3245M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3265 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3265M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3275 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-3275M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-10855M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-10885M " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1250 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1250E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1250P " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1250TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1270 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1270E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1270P " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1270TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1290 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1290E " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1290P " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1290T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-1290TE " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2102 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2104 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2123 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2125 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2133 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2135 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2145 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2155 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2175 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) W-2195 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5315Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5317 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5318N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5318S " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5320 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5320T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6312U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6314U " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6326 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6330 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6330N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6334 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6336Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6338 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6338N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6338T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6342 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6346 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6348 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 6354 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Gold 5318Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8351N " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8352S " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8352V " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8352Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8358 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8358P " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8360Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8368 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8368Q " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Platinum 8380 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4309Y " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4310 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4310T " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4314 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
type %temp%\CPUC.log | findstr /c:"Xeon(R) Silver 4316 " >nul 2>&1 && set "CPUComp=Compatible"  && goto cpufn  
) else (
    echo I currently only check for intel CPUs 
    pause >nul 
    exit 1;
)

:cpufn
if not "%CPUComp%"=="Compatible" ( set "cpucomp=Incompatible" )

echo. >con
:ttest
if not "%CPUComp%"=="Compatible" ( echo [91mYour Processor is not listed as compatible at the time of this program creation[0m >con && set "cre=[103m?[106m ") else ( echo Your Processor is listed as compatible. >con && set "cre=[102mOK[106m")

::CPU Core Count
echo. >con
echo ------
echo. >con
echo Counting Cores ...
powershell Get-WmiObject -class Win32_processor ^| select -expandproperty NumberOfCores >%temp%\cpucn.log
powershell Get-WmiObject -class Win32_processor ^| select -expandproperty NumberOfLogicalProcessors >%temp%\cpulp.log
echo Your PC has %cpun% Cores.
set /p "cpucn=" <%temp%\cpucn.log
set /p "cpulp=" <%temp%\cpulp.log

if "%cpucn%" GEQ "002" ( echo [92mYour CPU core count is supported by Windows 11.[0m >con && set "crre=[102mOK[106m") else ( echo [91mYour CPU Core Count is not supported by Windows 11.[0m >con && set "crre=[41;37mX[106;30m ")

::CPU Freq
echo. >con
echo ------
echo. >con
echo Testing CPU Freq
powershell Get-WmiObject -class Win32_processor ^| select -expandproperty MaxClockSpeed >%temp%\cpuf.log
echo Your CPU freq is : %cpuf%
set /p "cpuf=" <%temp%\cpuf.log

if "%cpuf%" GEQ "1000" ( echo [92mYour CPU Frequency is supported by Windows 11.[0m >con && set "cfre=[102mOK[106m") else ( echo [91mYour CPU Frequency is not supported by Windows 11.[0m >con && set "cfre=[41;37mX[106;30m ")
echo. >con
echo ------
::RAM
echo. >con
echo Checking RAM installed... >con
for /f "delims=" %%P in ('powershell $MATH ^= Get-WmiObject -Class win32_computersystem -ComputerName localhost ^^^| select -expandproperty TotalPhysicalMemory^; [math]::round^($MATH/1GB^)') do set "ram=%%P"

@REM set /p "ram=" <%temp%\RAM.log

echo Your PC has %ram%GB RAM. >con
if "%ram%" GEQ "00000004" ( set "RamSp=Compatible"&& set "rre=[102mOK[106m")

if not "%RamSp%"=="Compatible" ( set "RamSp=Incompatible" && set "rre=[41;37mX[106;30m ")
if "%RamSp%"=="Compatible" ( set "RMSay=[92menough[0m")
if "%RamSp%"=="Incompatible" ( set "RMSay=[91mnot enough[0m")

echo Your RAM is %RMSay% to run Windows 11. >con

::Boot
echo. >con
echo ------
echo. >con
echo Checking Boot Mode... >con
echo Your PC boot mode is %firmware_type%. >con
if "%firmware_type%"=="UEFI" ( echo [92mYour PC boot mode is supported by Windows 11.[0m >con && set "bre=[102mOK[106m") else ( echo [91mYour PC boot mode is not supported by Windows 11. Consider switching to UEFI.[91m >con && set "bre=[41;37mX[106;30m ")





echo. >con
echo ------
echo. >con
echo Tests are complete, if any results shown in red above this means it is highly likley a windows 11 install will work 
pause >nul
exit 1;

