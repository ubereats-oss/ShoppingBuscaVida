@echo off
echo.
echo Instalando tela de Lojas...
echo.

echo [1/3] Criando pastas...
if not exist "lib\features\lojas" mkdir "lib\features\lojas"
if not exist "assets\images\lojas" mkdir "assets\images\lojas"
echo OK
echo.
pause

echo [2/3] Copiando arquivos...
copy /Y "arquivos\loja_model.dart" "lib\features\lojas\loja_model.dart"
if %errorlevel% neq 0 ( echo ERRO: loja_model.dart & pause & exit /b 1 )
echo OK: loja_model.dart

copy /Y "arquivos\lojas_data.dart" "lib\features\lojas\lojas_data.dart"
if %errorlevel% neq 0 ( echo ERRO: lojas_data.dart & pause & exit /b 1 )
echo OK: lojas_data.dart

copy /Y "arquivos\lojas_screen.dart" "lib\features\lojas\lojas_screen.dart"
if %errorlevel% neq 0 ( echo ERRO: lojas_screen.dart & pause & exit /b 1 )
echo OK: lojas_screen.dart
echo.
pause

echo [3/3] Rodando flutter pub get...
flutter pub get
if %errorlevel% neq 0 ( echo ERRO no flutter pub get & pause & exit /b 1 )

echo.
echo PRONTO!
echo Proximo passo: rode baixar_logos.bat para baixar as logomarcas
echo.
pause
