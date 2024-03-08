@echo off

for %%f in (*.jpg, *.png) do (
    echo Converting %%f
    cwebp "%%f" -o "%%~nf.webp"
)

echo Conversion completed.
pause
