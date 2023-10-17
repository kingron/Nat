@echo off
echo 端口映射工具 v1.0
echo 版权所有(C) 2019，Kingron
if "%1"=="/?" (
	echo.
	echo 用法: nat [命令] [服务器端口] [远程IP] [远程端口]
	echo 命令: l = 列出映射; a = 添加; d = 删除
	echo.
	echo 例子:
	echo   nat                        # 显示当前映射列表
	echo   nat /?                     # 查看帮助信息
	echo   nat a 100 10.10.10.13 8000 # 映射100端口到10.10.10.13的8000端口
	echo   nat d 100                  # 删除本机 100 端口映射
)

if "%1"=="a" (
  netsh firewall add portopening TCP %2 "端口映射 %2 => %3:%4" > nul
  netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%2 connectaddress=%3 connectport=%4
  goto end
)

if "%1"=="d" (
  echo.
  netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%2
  netsh firewall delete portopening TCP %2 > nul
  goto end
)

netsh interface portproxy show all

:end
if %errorlevel% gtr 0 pause
