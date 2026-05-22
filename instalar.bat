@echo off
echo.
echo Shopping Estrada do Coco - Instalando arquivos
echo.

echo [1/5] Criando pastas...
if not exist "lib\core\theme" mkdir "lib\core\theme"
if not exist "lib\core\constants" mkdir "lib\core\constants"
if not exist "lib\features\home\screens" mkdir "lib\features\home\screens"
if not exist "assets\images" mkdir "assets\images"
echo OK
echo.
pause

echo [2/5] Backup do main.dart original...
if exist "lib\main.dart" copy /Y "lib\main.dart" "lib\main.dart.bak" >nul
echo OK
echo.
pause

echo [3/5] Copiando arquivos...
copy /Y "arquivos\main.dart" "lib\main.dart"
if %errorlevel% neq 0 ( echo ERRO: main.dart & pause & exit /b 1 )
echo OK: lib\main.dart

copy /Y "arquivos\app_theme.dart" "lib\core\theme\app_theme.dart"
if %errorlevel% neq 0 ( echo ERRO: app_theme.dart & pause & exit /b 1 )
echo OK: lib\core\theme\app_theme.dart

copy /Y "arquivos\app_constants.dart" "lib\core\constants\app_constants.dart"
if %errorlevel% neq 0 ( echo ERRO: app_constants.dart & pause & exit /b 1 )
echo OK: lib\core\constants\app_constants.dart

copy /Y "arquivos\home_screen.dart" "lib\features\home\screens\home_screen.dart"
if %errorlevel% neq 0 ( echo ERRO: home_screen.dart & pause & exit /b 1 )
echo OK: lib\features\home\screens\home_screen.dart

copy /Y "arquivos\pubspec.yaml" "pubspec.yaml"
if %errorlevel% neq 0 ( echo ERRO: pubspec.yaml & pause & exit /b 1 )
echo OK: pubspec.yaml
echo.
pause

echo [4/5] Copiando logo...
if exist "arquivos\logo_sec.png" (
    copy /Y "arquivos\logo_sec.png" "assets\images\logo_sec.png" >nul
    echo OK: assets\images\logo_sec.png
) else (
    echo AVISO: logo_sec.png nao encontrada. Adicione depois em assets\images\
)
echo.
pause

echo [5/5] Rodando flutter pub get...
flutter pub get
if %errorlevel% neq 0 ( echo ERRO no flutter pub get & pause & exit /b 1 )

echo.
echo PRONTO! Para rodar o app: flutter run
echo.
pause
