#!/bin/bash

################################################################
# 
# Autostart setting
# 
# usage: ./autostart.sh --on/--off
#
#
# @author Dr. Takeyuki UEDA
# @copyright Copyright© Atelier UEDA 2018 - All rights reserved.
#
SCRIPT_DIR=$(cd $(dirname $0); pwd)
REAL_DIR=$(dirname $(realpath $0))
CMD=$(basename -z $SCRIPT_DIR | sed 's/\x0//g')

usage_exit(){
  echo "Usage: $0 [--on]/[--off]" 1>&2
  echo "  [--on]:               Set autostart as ON. " 			1>&2
  echo "  [--off]:              Set autostart as OFF. " 		1>&2
  echo "  [--status]:           Show current status. " 		 	1>&2
  exit 1
}

on(){
  # create systemctl unit file if not exist
  if [ ! -f ${CMD}.service ]; then
    cp ${REAL_DIR}/autostart.service ${CMD}.service
    sed -i "s@^WorkingDirectory=.*@WorkingDirectory=${SCRIPT_DIR}@" ${CMD}.service
    sed -i "s@^ExecStart=.*@ExecStart=${SCRIPT_DIR}/${CMD}@" ${CMD}.service
    sed -i "s@PIDFile=/var/run/.*@PIDFile=/var/run/${CMD}.pid@" ${CMD}.service
  fi
#	sudo cp ${SCRIPT_DIR}\/${CMD}.service /etc/systemd/system/${CMD}.service
  sudo ln -s ${SCRIPT_DIR}\/${CMD}.service /etc/systemd/system/${CMD}.service
  sudo systemctl daemon-reload
  sudo systemctl enable ${CMD}.service
  sudo systemctl start ${CMD}.service
}

off(){
  sudo systemctl stop ${CMD}.service
  sudo systemctl disable ${CMD}.service
}

status(){
  sudo systemctl status ${CMD}.service
}

while getopts ":-:" OPT
do
  case $OPT in
    -)
				case "${OPTARG}" in
					on)
								on
								;;
					off)
								off
								;;
					status)
								status
								;;
				esac
				;;
    \?) usage_exit
        ;;
  esac
done
