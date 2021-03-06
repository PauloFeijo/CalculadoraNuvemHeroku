@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\jboss\resteasy\resteasy-jaxrs\3.1.2.Final\resteasy-jaxrs-3.1.2.Final.jar;"%REPO%"\org\jboss\spec\javax\ws\rs\jboss-jaxrs-api_2.0_spec\1.0.1.Beta1\jboss-jaxrs-api_2.0_spec-1.0.1.Beta1.jar;"%REPO%"\org\jboss\resteasy\resteasy-jaxrs-services\3.1.2.Final\resteasy-jaxrs-services-3.1.2.Final.jar;"%REPO%"\org\jboss\spec\javax\annotation\jboss-annotations-api_1.2_spec\1.0.0.Final\jboss-annotations-api_1.2_spec-1.0.0.Final.jar;"%REPO%"\javax\activation\activation\1.1.1\activation-1.1.1.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.2\httpclient-4.5.2.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.4\httpcore-4.4.4.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\commons-codec\commons-codec\1.9\commons-codec-1.9.jar;"%REPO%"\commons-io\commons-io\2.5\commons-io-2.5.jar;"%REPO%"\net\jcip\jcip-annotations\1.0\jcip-annotations-1.0.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.0.Final\jboss-logging-3.3.0.Final.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\9.0.0.M10\tomcat-embed-core-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\9.0.0.M6\tomcat-embed-logging-juli-9.0.0.M6.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\9.0.0.M10\tomcat-embed-jasper-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\9.0.0.M10\tomcat-embed-el-9.0.0.M10.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.5.1\ecj-4.5.1.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\9.0.0.M10\tomcat-jasper-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\9.0.0.M10\tomcat-servlet-api-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\9.0.0.M10\tomcat-juli-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\9.0.0.M10\tomcat-el-api-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-api\9.0.0.M10\tomcat-api-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\9.0.0.M10\tomcat-util-scan-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-util\9.0.0.M10\tomcat-util-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\9.0.0.M10\tomcat-jasper-el-9.0.0.M10.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\9.0.0.M10\tomcat-jsp-api-9.0.0.M10.jar;"%REPO%"\org\jboss\resteasy\resteasy-jackson-provider\3.1.2.Final\resteasy-jackson-provider-3.1.2.Final.jar;"%REPO%"\org\codehaus\jackson\jackson-core-asl\1.9.13\jackson-core-asl-1.9.13.jar;"%REPO%"\org\codehaus\jackson\jackson-mapper-asl\1.9.13\jackson-mapper-asl-1.9.13.jar;"%REPO%"\org\codehaus\jackson\jackson-jaxrs\1.9.13\jackson-jaxrs-1.9.13.jar;"%REPO%"\org\codehaus\jackson\jackson-xc\1.9.13\jackson-xc-1.9.13.jar;"%REPO%"\org\hibernate\hibernate-core\4.2.3.Final\hibernate-core-4.2.3.Final.jar;"%REPO%"\antlr\antlr\2.7.7\antlr-2.7.7.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\org\jboss\spec\javax\transaction\jboss-transaction-api_1.1_spec\1.0.1.Final\jboss-transaction-api_1.1_spec-1.0.1.Final.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.0-api\1.0.1.Final\hibernate-jpa-2.0-api-1.0.1.Final.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\4.0.2.Final\hibernate-commons-annotations-4.0.2.Final.jar;"%REPO%"\org\javassist\javassist\3.15.0-GA\javassist-3.15.0-GA.jar;"%REPO%"\org\hibernate\hibernate-entitymanager\4.2.3.Final\hibernate-entitymanager-4.2.3.Final.jar;"%REPO%"\org\postgresql\postgresql\9.4.1211\postgresql-9.4.1211.jar;"%REPO%"\br\edu\fcv\Calculadora\1.0-SNAPSHOT\Calculadora-1.0-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
