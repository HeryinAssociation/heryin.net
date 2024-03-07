@Echo Off&SetLocal ENABLEDELAYEDEXPANSION
FOR %%a in (*) do (
  set "name=%%a"
  set "name=!name:(=!"
  set "name=!name:)=!"
  set "name=!name: =!"  REM 这行用于移除文件名中的空格
  ren "%%a" "!name!"
)
exit
