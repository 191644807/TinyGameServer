@echo off

IF NOT EXIST "tmp" MD "tmp"

::Э���ļ�·��, ���Ҫ����\������
set SOURCE_FOLDER=.\protocol
::����ļ��������˱��proto�ļ���IMP_FOLDER�����õ�proto�ļ���Ŀ¼
set IMP_FOLDER=.\protocol
::Java������·��
set JAVA_COMPILER_PATH=.\protoc.exe
::Java�ļ�����·��, ���Ҫ����\������
set JAVA_TARGET_PATH=.\tmp

:: �����·��
set outDirServer=..\..\tiny-gs\src\main\java
:: �ͻ���·��
set outDirClient=..\..\tiny-client\src\main\java
:: ��ʱ�ļ���
set tmpDir=tmp


::ɾ��֮ǰ�������ļ�
del %JAVA_TARGET_PATH%\*.* /f /s /q


::���������ļ�
for /f "delims=" %%i in ('dir /b "%SOURCE_FOLDER%\*.proto"') do (
    
    echo %JAVA_COMPILER_PATH% -I=%SOURCE_FOLDER%  --java_out=%JAVA_TARGET_PATH% %SOURCE_FOLDER%\%%i
    %JAVA_COMPILER_PATH% --proto_path=%IMP_FOLDER%  --java_out=%JAVA_TARGET_PATH% %SOURCE_FOLDER%\%%i
    
)

Xcopy "./%tmpDir%" "%outDirServer%" /s /e /d /y
Xcopy "./%tmpDir%" "%outDirClient%" /s /e /d /y

echo Э��������ϡ�

pause