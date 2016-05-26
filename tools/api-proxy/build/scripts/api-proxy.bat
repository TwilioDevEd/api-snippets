@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  api-proxy startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and API_PROXY_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\api-proxy.jar;%APP_HOME%\lib\wiremock-1.58.jar;%APP_HOME%\lib\commons-io-2.5.jar;%APP_HOME%\lib\json-simple-1.1.1.jar;%APP_HOME%\lib\httpclient-4.5.jar;%APP_HOME%\lib\jackson-core-2.6.0.jar;%APP_HOME%\lib\xmlunit-1.6.jar;%APP_HOME%\lib\jetty-6.1.26.jar;%APP_HOME%\lib\jackson-databind-2.6.0.jar;%APP_HOME%\lib\jsonassert-1.2.3.jar;%APP_HOME%\lib\json-path-0.8.1.jar;%APP_HOME%\lib\jackson-annotations-2.6.0.jar;%APP_HOME%\lib\jopt-simple-4.9.jar;%APP_HOME%\lib\slf4j-api-1.7.12.jar;%APP_HOME%\lib\guava-18.0.jar;%APP_HOME%\lib\junit-4.10.jar;%APP_HOME%\lib\httpcore-4.4.1.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\jetty-util-6.1.26.jar;%APP_HOME%\lib\servlet-api-2.5-20081211.jar;%APP_HOME%\lib\json-20090211.jar;%APP_HOME%\lib\json-smart-1.1.1.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\hamcrest-core-1.1.jar

@rem Execute api-proxy
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %API_PROXY_OPTS%  -classpath "%CLASSPATH%" ApiProxy %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable API_PROXY_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%API_PROXY_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
