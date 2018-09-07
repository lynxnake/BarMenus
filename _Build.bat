@echo on && setlocal

set RootDir=%~dp0
pushd %RootDir%Packages\10.2

set BuildKind=Make
set RSVars=C:\Program Files (x86)\Embarcadero\Studio\19.0\bin\rsvars.bat
set MSBuild=msbuild

call "%RSVars%"

:Build
for %%i in (Debug Release) do (
	for %%j in (Win32) do (
		rem build
		for %%k in (*.dproj) do (
			%MSBuild% %%k /t:%BuildKind% /p:config=%%i /p:platform=%%j
		)

		rem copy resources
		for %%k in (res dfm) do (
			xcopy %RootDir%Source\*.%%k %%j\%%i\ /y
		)
	)
)

goto:eof