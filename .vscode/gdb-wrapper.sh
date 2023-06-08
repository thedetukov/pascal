QUOTED_GDB_TTY_CMD=$(echo $@ | cut -d ' ' -f 3-)
GDB_TTY_CMD=$(echo "${QUOTED_GDB_TTY_CMD}" | sed 's/"//g')
exec /usr/bin/kitty sh -c "${GDB_TTY_CMD}"