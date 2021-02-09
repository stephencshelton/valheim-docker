# cat start_server.sh
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 -name ${SRV_NAME} -port ${GAME_PORT} -world ${WORLD_NAME} -password ${SRV_PWD} -public ${PUBLIC} > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Server started"
echo ""
read -p "Press RETURN to stop server"
echo 1 > server_exit.drp

echo "Server exit signal set"
echo "You can now close this terminal"
