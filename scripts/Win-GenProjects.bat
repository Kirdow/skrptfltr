@echo off
pushd %~dp0\..\
echo ^|------------------------------^|
echo ^|- GENERATING VS2019 SOLUTION -^|
echo ^|------------------------------^|
call vendor\premake\bin\premake5.exe vs2019
echo ^|------------------------------^|
echo ^|------------ DONE ------------^|
echo ^|------------------------------^|
popd
PAUSE
