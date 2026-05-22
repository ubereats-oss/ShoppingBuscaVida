@echo off
echo.
echo Baixando logos das lojas...
echo.

if not exist "assets\images\lojas" mkdir "assets\images\lojas"

curl -L -o "assets\images\lojas\salao_la_maison.jpg"        "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-copia-8.jpg"
echo OK: salao_la_maison.jpg

curl -L -o "assets\images\lojas\quantum_health.png"         "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Final-Curva-1024x254.png"
echo OK: quantum_health.png

curl -L -o "assets\images\lojas\loteria.jpg"                "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Loterica-Estrada-do-Coco.jpg"
echo OK: loteria.jpg

curl -L -o "assets\images\lojas\dijana.jpg"                 "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Logotipo-DijanaPraiaFitness_vertical.jpg"
echo OK: dijana.jpg

curl -L -o "assets\images\lojas\bahia_oculos.png"           "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Bahia-Oculos-Preto-SVG.png"
echo OK: bahia_oculos.png

curl -L -o "assets\images\lojas\barbearia_capelli.jpg"      "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-BARBEARIA-CAPELLI-1024x1024.jpg"
echo OK: barbearia_capelli.jpg

curl -L -o "assets\images\lojas\platta_bahia.png"           "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/Platta-Bahia-1.png"
echo OK: platta_bahia.png

curl -L -o "assets\images\lojas\mais1cafe.jpg"              "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-copia-7.jpg"
echo OK: mais1cafe.jpg

curl -L -o "assets\images\lojas\bah_cafe.jpg"               "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-copia-9.jpg"
echo OK: bah_cafe.jpg

curl -L -o "assets\images\lojas\spa_sobrancelhas.jpg"       "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-copia-5-1-1024x1024.jpg"
echo OK: spa_sobrancelhas.jpg

curl -L -o "assets\images\lojas\ilha_delicias.jpg"          "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/LOGO-ILHA-DAS-DELICIAS-1024x1024.jpg"
echo OK: ilha_delicias.jpg

curl -L -o "assets\images\lojas\salao_rene.webp"            "https://shoppingestradadococo.com.br/wp-content/uploads/2025/03/Design-sem-nome-_6_.webp"
echo OK: salao_rene.webp

curl -L -o "assets\images\lojas\kemi.png"                   "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Salao-KEMI-1024x710.png"
echo OK: kemi.png

curl -L -o "assets\images\lojas\freelaser.png"              "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-FREELASER-1024x284.png"
echo OK: freelaser.png

curl -L -o "assets\images\lojas\confortice.jpg"             "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Confortice-768x1024.jpg"
echo OK: confortice.jpg

curl -L -o "assets\images\lojas\luz_divina.png"             "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/LOGO-LUZ-DIVINA-1024x1024.png"
echo OK: luz_divina.png

curl -L -o "assets\images\lojas\complementare.jpg"          "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-1024x1024.jpg"
echo OK: complementare.jpg

curl -L -o "assets\images\lojas\mais_stylosa.jpg"           "https://shoppingestradadococo.com.br/wp-content/uploads/2024/06/Lojas_Prancheta-1-copia-6-1024x1024.jpg"
echo OK: mais_stylosa.jpg

curl -L -o "assets\images\lojas\emporium_x.png"             "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/MArca-Emporium-X-724x1024.png"
echo OK: emporium_x.png

curl -L -o "assets\images\lojas\thump.png"                  "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/Adesivo_sacola_thump.png"
echo OK: thump.png

curl -L -o "assets\images\lojas\bonfim_smart.jpg"           "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-BONFIM-SMART-1024x682.jpg"
echo OK: bonfim_smart.jpg

curl -L -o "assets\images\lojas\cor_da_mel.jpg"             "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-COR-DA-MEL.jpg"
echo OK: cor_da_mel.jpg

curl -L -o "assets\images\lojas\marie_marie.jpg"            "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-MARIE-MARIE.jpeg"
echo OK: marie_marie.jpg

curl -L -o "assets\images\lojas\ricardo_dias.jpg"           "https://shoppingestradadococo.com.br/wp-content/uploads/2024/12/LOGO-RICARDO-DIAS-CURSO-DE-DESENHO.jpg"
echo OK: ricardo_dias.jpg

curl -L -o "assets\images\lojas\herbalife.jpg"              "https://shoppingestradadococo.com.br/wp-content/uploads/2025/04/LOGO-HERBALIFE.jpg"
echo OK: herbalife.jpg

echo.
echo ============================================================
echo  PRONTO! 25 logos baixadas em assets\images\lojas\
echo ============================================================
echo.
pause
