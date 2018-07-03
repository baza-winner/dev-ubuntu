
# =============================================================================

_resetBash

# =============================================================================

# bgate_apiParams=( 'applicationEnv:(local test alpha omega production)=alpha' )
# bgate_api_applicationEnv_name='Имя-среды'
# bgate_api_applicationEnv_description='Совпадает с именем одного из ${_ansiFileSpec}.php${_ansiReset}-файлов из ${_ansiFileSpec}src/protected/config${_ansiReset}'
# bgate_api_description='(Пере)Запускает service php5-fpm'
# bgate_api() { eval "$_funcParams2"
#   if ! _isInDocker; then
#     _docker exec "$_bgateDockerContainerName" /home/dev/proj/docker/bin/cmd.bash api $applicationEnv
#   else
# 	  _exec --sudo service php5-fpm stop

# 	  echo "$applicationEnv" > "$HOME/proj/src/application_env"
	  
# 		_exec --sudo service php5-fpm start

# 	  echo "Сервис (среда ${_ansiPrimaryLiteral}$applicationEnv${_ansiReset}) доступен по следущим URL'ам:"
# 	  echo "  ${_ansiUrl}http://localhost:${_dockerHttp}${_ansiReset}"
# 	  echo "  ${_ansiUrl}https://localhost:${_dockerHttps}${_ansiReset}"
# 	fi
# }

# bgate_docker_upParamsAddon=(
#   '--xdebug-remote-host=${XDEBUG_REMOTE_HOST:-$(_getDefaultXdebugRemoteHost)}'
#   '--xdebug-remote-port=${XDEBUG_REMOTE_PORT:-9002}'
#   '--xdebug-ide-key=${XDEBUG_IDE_KEY:-ide.xdebug}'
# )
# bgate_docker_up_xdebugRemoteHost_description='Значение для параметра ${_ansiOutline}xdebug.remote_host${_ansiReset} файла ${_ansiCmd}xdebug.ini${_ansiReset} '
# bgate_docker_up_xdebugRemotePort_description='Значение для параметра ${_ansiOutline}xdebug.remote_port${_ansiReset} файла ${_ansiCmd}xdebug.ini${_ansiReset} '
# bgate_docker_up_xdebugIdeKey_description='Значение для параметра ${_ansiOutline}xdebug.idekey${_ansiReset} файла ${_ansiCmd}xdebug.ini${_ansiReset} '
# _bgate_docker_upAddon() {
#   if [[ $xdebugRemoteHost == "$_loopbackAlias" ]]; then 
#     if [[ $OSTYPE =~ ^darwin ]]; then
#       sudo ifconfig lo0 alias 10.254.254.254
#     else
#       sudo ifconfig lo:0 10.254.254.254 netmask 255.0.0.0 up
#     fi
#   fi

#   local xdebugDir="$_bgateDir/docker/xdebug"
  
#   xdebugRemotePort="$xdebugRemotePort" \
#   xdebugRemoteHost="$xdebugRemoteHost" \
#   xdebugIdeKey="$xdebugIdeKey" \
#   perl -pe 's/\${([^}]+)}/$ENV{$1}/e' "$xdebugDir/xdebug.ini.template" > "$xdebugDir/xdebug.ini"
# }

_initBwProjCmd

# =============================================================================
