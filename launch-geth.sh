BASEDIR=$(dirname"$0")
geth --networkid 42 --datadir ~/.ethereum.net42 init $BASEDIR/genesis42.js
geth --networkid 42 --datadir ~/.ethereum.net42 --rpc --rpcport8545  --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,web3" --unlock "0,1,2,3" --password $BASEDIR/passsword.txt console

OUT=$?
if [ $OUT -eq 0 ];then
        echo ""
else
  geth --networkid 42 --datadir ~/.ethereum.net42 --rpc --rpcport8545  --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,web3" --password $BASEDIR/password.txt account new
  geth --networkid 42 --datadir ~/.ethereum.net42 --rpc --rpcport8545  --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,web3" --password $BASEDIR/password.txt account new
  geth --networkid 42 --datadir ~/.ethereum.net42 --rpc --rpcport8545  --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,web3" --password $BASEDIR/password.txt account new
  geth --networkid 42 --datadir ~/.ethereum.net42 --rpc --rpcport8545  --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "eth,web3" --password $BASEDIR/password.txt account new
fi
