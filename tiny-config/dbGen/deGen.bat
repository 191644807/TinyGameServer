
IF NOT EXIST "tmp" MD "tmp"

set inputFile=db.xml
set outDir=tmp
set outDirConfig=..\..\tiny-gs\src\main\java\tiny\

::Ӧ�ò���ɾ��֮ǰ�������ļ�
::del %JAVA_TARGET_PATH%\*.* /f /s /q

java -Dfile.encoding=utf-8 -jar dbGen.jar %inputFile% %outDir% tiny

::Xcopy "./%tmpDir%" "%outDirServer%" /s /e /d /y
::Xcopy "./%tmpDir%" "%outDirClient%" /s /e /d /y
Xcopy "./%outDir%" "%outDirConfig%" /s /e /d /y

::rd %tmpDir% /s /q

echo ���ݿ�bean������ϡ�

pause