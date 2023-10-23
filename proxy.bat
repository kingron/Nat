@echo off

if "%1"=="/?" (
	echo 设置系统代理
	echo 用法:
	echo     %~n0 [/d] [proxy] [/?]
	echo       /d 		取消代理设置
	echo.      /?     	查看帮助
	echo       proxy    设置代理为 proxy
	echo 示例:
	echo     %~n0 /d
	echo     %~n0 http://1.2.3.4:1080
	echo     %~n0 https://www.abc.com:443
	goto end
)

if "%1"=="/d" (
	set https_proxy=
	set http_proxy=
	set ftp_proxy=
	goto end
)

if "%1"=="" (
  set ps=http://127.0.0.1:8080
) else (
  set ps=%1
)
set ftp_proxy=%ps%
set http_proxy=%ps%
set https_proxy=%ps%

:end
